import 'UserEntity.dart';

/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti@gmail.com"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2OGVmZGY4ZWQwZGMwMDE2Yzk4Yjk1YSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzIzMTI0Mjg2LCJleHAiOjE3MzA5MDAyODZ9.--djqIjPwCIUekKLolPOs-esEdrnt_x6mOZtafrTSSU"

class AuthEntity {
  AuthEntity({
      this.user, 
      this.token,});


  UserEntity? user;
  String? token;



}