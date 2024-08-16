import 'package:e_commerce_route/domain/entites/Auth_Entity/UserEntity.dart';

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti@gmail.com"
/// role : "user"

class UserModel {
  UserModel({
      this.name, 
      this.email, 
      this.role,});

  UserModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  UserEntity toUserEntity(){
    return UserEntity(
        name: name,
        email: email
    );
  }
}