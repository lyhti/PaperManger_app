import './model.dart';

/**
 * 문서종류 모델
 */
class DocumentType extends Model {
  int? documentTypeSn;             // 문서종류 일련번호
  String? documentTypeNm;          // 문서종류 이름
  String? codeAbbreviation;        // 문서종류 구분코드 약어
  String? codeExpansion;           // 문서종류 구분코드 전체(풀네임)
  double? version;                 // 문서종류 버전
  int? dataVersion;
  int? viewVersion;

  int? crtUserSn;                  // 생성자
  DateTime? crtDt;                 // 생성 일시
  int? udtUserSn;                  // 수정자
  DateTime? udtDt;                 // 수정 일시
  DateTime? delDt;                 // 삭제 일시

  DocumentType({
    this.documentTypeSn, this.documentTypeNm, this.codeAbbreviation, this.codeExpansion, this.version,
    this.crtUserSn, this.crtDt, this.udtUserSn, this.udtDt, this.delDt
  });

  DocumentType.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    documentTypeSn = intFromJson(json, 'document_type_sn');
    documentTypeNm = stringFromJson(json, 'document_type_nm');
    codeAbbreviation = stringFromJson(json, 'code_abbreviation');
    codeExpansion = stringFromJson(json, 'code_expansion');
    version = doubleFromJson(json, 'version');
    dataVersion = intFromJson(json, 'data_version');
    viewVersion = intFromJson(json, 'view_version');
    crtUserSn = intFromJson(json, 'crt_user_sn');
    crtDt = dateFromJson(json, 'crt_dt');
    udtUserSn = intFromJson(json, 'udt_user_sn');
    udtDt = dateFromJson(json, 'udt_dt');
    delDt = dateFromJson(json, 'del_dt');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['document_type_sn'] = documentTypeSn;
    data['document_type_nm'] = documentTypeNm;
    data['code_abbreviation'] = codeAbbreviation;
    data['code_expansion'] = codeExpansion;
    data['version'] = version;
    data['data_version'] = dataVersion;
    data['view_version'] = viewVersion;
    data['crt_user_sn'] = crtUserSn;
    data['crt_dt'] = crtDt;
    data['udt_user_sn'] = udtUserSn;
    data['udt_dt'] = udtDt;
    data['del_dt'] = delDt;
    return data;
  }
}