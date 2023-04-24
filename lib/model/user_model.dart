import './model.dart';

/**
 * 사용자 모델
 */
class User extends Model {
  int? userSn;                     // 유저일련번호
  int? entrpsSn;                   // 업체일련번호
  String? userNm;                  // 유저이름
  String? email;                   // 이메일
  String? password;                // 비밀번호
  String? phoneNumber;             // 전화번호
  String? apiToken;                // apiToken
  String? rememberToken;           // rememberToken
  bool? approved;                  // 승인여부

  int? crtUserSn;                  // 생성자
  DateTime? crtDt;                 // 생성 일시
  int? udtUserSn;                  // 수정자
  DateTime? udtDt;                 // 수정 일시
  DateTime? delDt;                 // 삭제 일시

  User({
    this.userSn, this.entrpsSn, this.userNm, this.email, this.password,
    this.phoneNumber, this.apiToken, this.rememberToken, this.approved,
    this.crtUserSn, this.crtDt, this.udtUserSn, this.udtDt, this.delDt
  });

  User.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    userSn = intFromJson(json, 'user_sn');
    entrpsSn = intFromJson(json, 'entrps_sn');
    userNm = stringFromJson(json, 'user_nm');
    email = stringFromJson(json, 'email');
    password = stringFromJson(json, 'password');
    phoneNumber = stringFromJson(json, 'phone_number');
    apiToken = stringFromJson(json, 'api_token');
    rememberToken = stringFromJson(json, 'remember_token');
    approved = boolFromJson(json, 'approved');
    crtUserSn = intFromJson(json, 'crt_user_sn');
    crtDt = dateFromJson(json, 'crt_dt');
    udtUserSn = intFromJson(json, 'udt_user_sn');
    udtDt = dateFromJson(json, 'udt_dt');
    delDt = dateFromJson(json, 'del_dt');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_sn'] = this.userSn;
    data['entrps_sn'] = this.entrpsSn;
    data['user_nm'] = this.userNm;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone_number'] = this.phoneNumber;
    data['api_token'] = this.apiToken;
    data['remember_token'] = this.rememberToken;
    data['approved'] = this.approved;
    data['crt_user_sn'] = this.crtUserSn;
    data['crt_dt'] = this.crtDt;
    data['udt_user_sn'] = this.udtUserSn;
    data['udt_dt'] = this.udtDt;
    data['del_dt'] = this.delDt;
    return data;
  }
}