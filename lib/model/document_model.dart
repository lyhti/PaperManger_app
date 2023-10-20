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

  int? dataVersion;                 // data 버전
  int? viewVersion;                 // view 버전

  Document({
    this.documentSn, this.documentTypeSn, this.entrpsSn, this.title, this.version, this.tabCnt, this.useYn,
    this.crtUserSn, this.crtDt, this.udtUserSn, this.udtDt, this.delDt, this.documentTypeNm, this.userNm, this.codeAbbreviation, this.dataVersion, this.viewVersion
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
    dataVersion = intFromJson(json, 'data_version');
    viewVersion = intFromJson(json, 'view_version');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['document_sn'] = documentSn;
    data['document_type_sn'] = documentTypeSn;
    data['entrps_sn'] = entrpsSn;
    data['title'] = title;
    data['version'] = version;
    data['tab_cnt'] = tabCnt;
    data['use_yn'] = useYn;

    data['crt_user_sn'] = crtUserSn;
    data['crt_dt'] = crtDt;
    data['udt_user_sn'] = udtUserSn;
    data['udt_dt'] = udtDt;
    data['del_dt'] = delDt;

    data['document_type_nm'] = documentTypeNm;
    data['user_nm'] = userNm;
    data['code_abbreviation'] = codeAbbreviation;
    data['data_version'] = dataVersion;
    data['view_version'] = viewVersion;
    return data;
  }
}