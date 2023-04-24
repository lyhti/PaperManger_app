import './model.dart';

/**
 * 문서종류관계 모델
 */
class DocumentTypeEmploy extends Model {
  int? entrpsSn;                   // 업체 일련번호
  int? documentTypeSn;          // 문서종류 일련번호

  int? crtUserSn;                  // 생성자
  DateTime? crtDt;                 // 생성 일시
  int? udtUserSn;                  // 수정자
  DateTime? udtDt;                 // 수정 일시
  DateTime? delDt;                 // 삭제 일시

  DocumentTypeEmploy({
    this.entrpsSn, this.documentTypeSn,
    this.crtUserSn, this.crtDt, this.udtUserSn, this.udtDt, this.delDt
  });

  DocumentTypeEmploy.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    entrpsSn = intFromJson(json, 'entrps_sn');
    documentTypeSn = intFromJson(json, 'document_type_sn');
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
    data['document_type_sn'] = this.documentTypeSn;
    data['crt_user_sn'] = this.crtUserSn;
    data['crt_dt'] = this.crtDt;
    data['udt_user_sn'] = this.udtUserSn;
    data['udt_dt'] = this.udtDt;
    data['del_dt'] = this.delDt;
    return data;
  }
}