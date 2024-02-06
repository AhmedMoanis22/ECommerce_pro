class UserModel {
  String? msg;
  UserInfo? field;

  UserModel({this.msg, this.field});

  UserModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    field = json['userInfo'] != null
        ?  UserInfo.fromJson(json['userInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.field != null) {
      data['userInfo'] = this.field!.toJson();
    }
    return data;
  }
}


class UserInfo {
  int? uId;
  String? username;
  String? email;
  String? password;
  String? phone;
  String? verifyCode;
  String? userApproval;
  String? accountCreated;
  String? imgProfile;

  UserInfo(
      {this.uId,
      this.username,
      this.email,
      this.password,
      this.phone,
      this.verifyCode,
      this.userApproval,
      this.accountCreated,
      this.imgProfile});

  UserInfo.fromJson(Map<String, dynamic> json) {
    uId = json['u_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    verifyCode = json['verify_code'];
    userApproval = json['user_approval'];
    accountCreated = json['account_created'];
    imgProfile = json['img_profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['u_id'] = this.uId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['verify_code'] = this.verifyCode;
    data['user_approval'] = this.userApproval;
    data['account_created'] = this.accountCreated;
    data['img_profile'] = this.imgProfile;
    return data;
  }
}

