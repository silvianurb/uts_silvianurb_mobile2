import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:uts_pm2_silvianurb/data/model/user.dart';

class RemoteDataSource {
  final dio = Dio(BaseOptions(
      baseUrl:
          'https://65a8ac8b219bfa3718675d98.mockapi.io/espresso_edu/api/user'));

  Future<DataUser> getUsers() async {
    final response = await dio.get('/kopis');
    log(response.data.toString());
    return DataUser.fromJson(response.data);
  }

  Future<User> createUser(User newUser) async {
    final response = await dio.post('/kopis', data: newUser.toJson());
    log(response.data.toString());
    return User.fromModel(response.data);
  }

  Future<User> updateUser(User updatedUser) async {
    final response =
        await dio.put('/kopis/${updatedUser.id}', data: updatedUser.toJson());
    log(response.data.toString());
    return User.fromModel(response.data);
  }

  Future<void> deleteUser(int userId) async {
    await dio.delete('/kopis/$userId');
  }
}
