import './model.dart';

/**
 * 문서컬럼 모델
 */
class DocumentColumn extends Model {
  int? documentColumnSn;               // 문서컬럼 일련번호
  int? documentTypeSn;                 // 문서종류 일련번호
  String? documentColumnNm;            // 문서컬럼 이름
  String? documentColumnValue;         // 문서컬럼 값
  String? documentColumnDefaultValue;  // 문서컬럼 기본값
  bool? fileFlagYn;                    // 문서컬럼 파일업로드 유무

  int? crtUserSn;                      // 생성자
  DateTime? crtDt;                     // 생성 일시
  int? udtUserSn;                      // 수정자
  DateTime? udtDt;                     // 수정 일시
  DateTime? delDt;                     // 삭제 일시

  DocumentColumn({
    this.documentColumnSn, this.documentTypeSn, this.documentColumnNm, this.documentColumnValue, this.documentColumnDefaultValue,
    this.fileFlagYn, this.crtUserSn, this.crtDt, this.udtUserSn, this.udtDt, this.delDt
  });

  DocumentColumn.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    documentColumnSn = intFromJson(json, 'document_column_sn');
    documentTypeSn = intFromJson(json, 'document_type_sn');
    documentColumnNm = stringFromJson(json, 'document_column_nm');
    documentColumnValue = stringFromJson(json, 'document_column_value');
    documentColumnDefaultValue = stringFromJson(json, 'document_column_default_value');
    fileFlagYn = boolFromJson(json, 'file_flag_yn');
    crtUserSn = intFromJson(json, 'crt_user_sn');
    crtDt = dateFromJson(json, 'crt_dt');
    udtUserSn = intFromJson(json, 'udt_user_sn');
    udtDt = dateFromJson(json, 'udt_dt');
    delDt = dateFromJson(json, 'del_dt');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['document_column_sn'] = this.documentColumnSn;
    data['document_type_sn'] = this.documentTypeSn;
    data['document_column_nm'] = this.documentColumnNm;
    data['document_column_value'] = this.documentColumnValue;
    data['document_column_default_value'] = this.documentColumnDefaultValue;
    data['file_flag_yn'] = this.fileFlagYn;
    data['crt_user_sn'] = this.crtUserSn;
    data['crt_dt'] = this.crtDt;
    data['udt_user_sn'] = this.udtUserSn;
    data['udt_dt'] = this.udtDt;
    data['del_dt'] = this.delDt;
    return data;
  }
}