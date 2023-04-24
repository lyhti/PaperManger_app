import './model.dart';

/**
 * 업체 모델
 */
class Enterprise extends Model {
  int? entrpsSn;                   // 업체일련번호
  String? entrpsNm;                // 업체명
  String? brno;                    // 사업자번호
  String? email;                   // 이메일
  String? rprsvNm;                 // 대표이름
  String? telNumber;               // 전화번호
  String? faxNumber;               // fax번호
  String? zip;                     // 우편번호
  String? address;                 // 주소
  String? detailAddress;           // 상세주소

  int? crtUserSn;                  // 생성자
  DateTime? crtDt;                 // 생성 일시
  int? udtUserSn;                  // 수정자
  DateTime? udtDt;                 // 수정 일시
  DateTime? delDt;                 // 삭제 일시

  Enterprise({
    this.entrpsSn, this.entrpsNm, this.brno, this.email, this.rprsvNm,
    this.telNumber, this.faxNumber, this.zip, this.address, this.detailAddress,
    this.crtUserSn, this.crtDt, this.udtUserSn, this.udtDt, this.delDt
  });

  Enterprise.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    entrpsSn = intFromJson(json, 'entrps_sn');
    entrpsNm = stringFromJson(json, 'entrps_nm');
    brno = stringFromJson(json, 'brno');
    email = stringFromJson(json, 'email');
    rprsvNm = stringFromJson(json, 'rprsv_nm');
    telNumber = stringFromJson(json, 'tel_number');
    faxNumber = stringFromJson(json, 'fax_number');
    zip = stringFromJson(json, 'zip');
    address = stringFromJson(json, 'address');
    detailAddress = stringFromJson(json, 'detail_address');
    crtUserSn = intFromJson(json, 'crt_user_sn');
    crtDt = dateFromJson(json, 'crt_dt');
    udtUserSn = intFromJson(json, 'udt_user_sn');
    udtDt = dateFromJson(json, 'udt_dt');
    delDt = dateFromJson(json, 'del_dt');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['entrps_sn'] = this.entrpsSn;
    data['entrps_nm'] = this.entrpsNm;
    data['brno'] = this.brno;
    data['email'] = this.email;
    data['rprsv_nm'] = this.rprsvNm;
    data['tel_number'] = this.telNumber;
    data['fax_number'] = this.faxNumber;
    data['zip'] = this.zip;
    data['address'] = this.address;
    data['detail_address'] = this.detailAddress;
    data['crt_user_sn'] = this.crtUserSn;
    data['crt_dt'] = this.crtDt;
    data['udt_user_sn'] = this.udtUserSn;
    data['udt_dt'] = this.udtDt;
    data['del_dt'] = this.delDt;
    return data;
  }
}