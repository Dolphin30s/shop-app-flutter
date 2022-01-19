import 'package:open_cart/models/base_model.dart';

class UserModel extends BaseModel {
  final String userId;
  final String userEmail;
  final String userName;
  final int userPhone;

  UserModel(
      {required this.userName,
      required this.userPhone,
      required this.userId,
      required this.userEmail});

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
      userId: data["userId"],
      userEmail: data["userEmail"],
      userName: data["userName"],
      userPhone: data["userPhone"]);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "userId": userId,
        "userEmail": userEmail,
        "userName": userName,
        "userPhone": userPhone,
      };
}
