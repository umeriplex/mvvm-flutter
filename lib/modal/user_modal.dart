/// token : "QpwL5tke4Pnpja7X4"

class UserModal {
  UserModal({
      String? token,}){
    _token = token;
}

  UserModal.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;
UserModal copyWith({  String? token,
}) => UserModal(  token: token ?? _token,
);
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}