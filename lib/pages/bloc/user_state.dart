part of 'user_bloc.dart';

@immutable
abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final List<User> kopis;
  const UserLoaded(this.kopis);
}

class UserError extends UserState {
  final String error;
  const UserError(this.error);
}
