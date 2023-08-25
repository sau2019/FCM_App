class UserInfo {
  int id;
  String name;
  String mobileNo;
  String email;
  String password;
  int status;
  DateTime updatedDate;
  DateTime createdDate;

  UserInfo({
    required this.id,
    required this.name,
    required this.mobileNo,
    required this.email,
    required this.password,
    required this.status,
    required this.updatedDate,
    required this.createdDate,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        name: json["name"],
        mobileNo: json["mobile_no"],
        email: json["email"],
        password: json["password"],
        status: json["status"],
        updatedDate: DateTime.parse(json["updated_date"]),
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile_no": mobileNo,
        "email": email,
        "password": password,
        "status": status,
        "updated_date": updatedDate.toIso8601String(),
        "created_date": createdDate.toIso8601String(),
      };
}
