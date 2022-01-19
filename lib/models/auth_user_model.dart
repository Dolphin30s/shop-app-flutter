// ignore_for_file: prefer_typing_uninitialized_variables

class AuthUserModel {
  AuthUserModel({
    // required this.name,
    // required this.job,
    required this.id,
    // required this.createdAt,
    required this.token,
  });

  // String name;
  // String job;
  String id;
  var token;
  // DateTime createdAt;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) => AuthUserModel(
        // name: json["name"],
        // job: json["job"],
        id: json["email"],
        token: json['idToken'],
        // createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        // "name": name,
        // "job": job,
        "email": id,
        "idToken": token,
        // "createdAt": createdAt.toString(),
      };
}
