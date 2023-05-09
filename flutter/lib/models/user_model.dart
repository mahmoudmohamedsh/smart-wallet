class UserModel {
  UserModel({
    String? token,
  }) {
    _token = token;
  }

  UserModel.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;
  UserModel copyWith({
    String? token,
  }) =>
      UserModel(
        token: token ?? _token,
      );
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }
}

// class UserModel {
//   String userId, email, name, pic;
//
//   UserModel({this.userId, this.email, this.name, this.pic});
//
//   UserModel.fromJson(Map<dynamic, dynamic> map) {
//     if (map == null) {
//       return;
//     }
//     userId = map['userId'];
//     email = map['email'];
//     name = map['name'];
//     pic = map['pic'];
//   }
//
//   toJson() {
//     return {
//       'userId': userId,
//       'email': email,
//       'name': name,
//       'pic': pic,
//     };
//   }
// }