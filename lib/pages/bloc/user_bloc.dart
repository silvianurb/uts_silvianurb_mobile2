// user_bloc.dart

import 'package:flutter/material.dart';
import 'package:uts_pm2_silvianurb/data/datasource/remote_datasource.dart';
import 'package:uts_pm2_silvianurb/data/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RemoteDataSource remoteDataSource;

  UserBloc({required this.remoteDataSource}) : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      emit(UserLoading());
      try {
        final result = await remoteDataSource.getUsers();
        emit(UserLoaded(result.data));
      } catch (error) {
        emit(UserError(error.toString()));
      }
    });

    on<CreateUser>((event, emit) async {
      try {
        final createdUser = await remoteDataSource.createUser(event.newUser);
        if (state is UserLoaded) {
          final updatedUsers = (state as UserLoaded).kopis + [createdUser];
          emit(UserLoaded(updatedUsers));
        }
      } catch (error) {
        emit(UserError(error.toString()));
      }
    });

    on<UpdateUser>((event, emit) async {
      try {
        final updatedUser =
            await remoteDataSource.updateUser(event.updatedUser);
        if (state is UserLoaded) {
          final updatedUsers = (state as UserLoaded)
              .kopis
              .map((user) => user.id == updatedUser.id ? updatedUser : user)
              .toList();
          emit(UserLoaded(updatedUsers));
        }
      } catch (error) {
        emit(UserError(error.toString()));
      }
    });

    on<DeleteUser>((event, emit) async {
      try {
        await remoteDataSource.deleteUser(event.userId);
        if (state is UserLoaded) {
          final remainingUsers = (state as UserLoaded)
              .kopis
              .where((user) => user.id != event.userId)
              .toList();
          emit(UserLoaded(remainingUsers));
        }
      } catch (error) {
        emit(UserError(error.toString()));
      }
    });
  }
}
