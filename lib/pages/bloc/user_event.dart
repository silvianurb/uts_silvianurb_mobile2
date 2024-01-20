part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class LoadUser extends UserEvent {}

final class CreateUser extends UserEvent {
  final User newUser;
  CreateUser(this.newUser);
}

final class UpdateUser extends UserEvent {
  final User updatedUser;
  UpdateUser(this.updatedUser);
}

final class DeleteUser extends UserEvent {
  final int userId;
  DeleteUser(this.userId);
}
