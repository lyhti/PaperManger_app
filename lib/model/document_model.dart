import './model.dart';

/**
 * 문서 모델
 */
class Document extends Model {
  int? documentSn;                 // 문서일련번호
  int? documentTypeSn;             // 문서종류일련번호
  int? entrpsSn;                   // 업체일련번호
  String? title;                   // 문서이름
  double? version;                 // 문서버전
  int? tabCnt;                     // 문서 탭 개수
  bool? useYn;                     // 문서 사용여부

  int? crtUserSn;                  // 생성자
  DateTime? crtDt;                 // 생성 일시
  int? udtUserSn;                  // 수정자
  DateTime? udtDt;                 // 수정 일시
  DateTime? delDt;                 // 삭제 일시

  String? documentTypeNm;          // 문서종류
  String? userNm;                  // 작성자이름
  String? codeAbbreviation;        // 문서종류_구분코드

  Document({
    this.documentSn, this.documentTypeSn, this.entrpsSn, this.title, this.version, this.tabCnt, this.useYn,
    this.crtUserSn, this.crtDt, this.udtUserSn, this.udtDt, this.delDt, this.documentTypeNm, this.userNm, this.codeAbbreviation
  });

  Document.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    documentSn = intFromJson(json, 'document_sn');
    documentTypeSn = intFromJson(json, 'document_type_sn');
    entrpsSn = intFromJson(json, 'entrps_sn');
    title = stringFromJson(json, 'title');
    version = doubleFromJson(json, 'version');
    tabCnt = intFromJson(json, 'tab_cnt');
    useYn = boolFromJson(json, 'use_yn');

    crtUserSn = intFromJson(json, 'crt_user_sn');
    crtDt = dateFromJson(json, 'crt_dt');
    udtUserSn = intFromJson(json, 'udt_user_sn');
    udtDt = dateFromJson(json, 'udt_dt');
    delDt = dateFromJson(json, 'del_dt');

    documentTypeNm = stringFromJson(json, 'document_type_nm');
    userNm = stringFromJson(json, 'user_nm');
    codeAbbreviation = stringFromJson(json, 'code_abbreviation');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['document_sn'] = this.documentSn;
    data['document_type_sn'] = this.documentTypeSn;
    data['entrps_sn'] = this.entrpsSn;
    data['title'] = this.title;
    data['version'] = this.version;
    data['tab_cnt'] = this.tabCnt;
    data['use_yn'] = this.useYn;

    data['crt_user_sn'] = this.crtUserSn;
    data['crt_dt'] = this.crtDt;
    data['udt_user_sn'] = this.udtUserSn;
    data['udt_dt'] = this.udtDt;
    data['del_dt'] = this.delDt;

    data['document_type_nm'] = this.documentTypeNm;
    data['user_nm'] = this.userNm;
    data['code_abbreviation'] = this.codeAbbreviation;
    return data;
  }
}