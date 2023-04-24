import './model.dart';

/**
 * 문서데이터 모델
 */
class DocumentData extends Model {
  int? documentDataSn;             // 문서데이터 일련번호
  int? documentSn;                 // 문서 일련번호
  int? documentColumnSn;           // 문서컬럼 일련번호
  String? documentDataValue;       // 문서데이터 값
  String? param01;                 // 임시 01
  String? param02;                 // 임시 02
  String? param03;                 // 임시 03
  String? param04;                 // 임시 04
  String? param05;                 // 임시 05
  String? param06;                 // 임시 06
  String? param07;                 // 임시 07
  String? param08;                 // 임시 08
  String? param09;                 // 임시 09
  String? param10;                 // 임시 10

  int? crtUserSn;                  // 생성자
  DateTime? crtDt;                 // 생성 일시
  int? udtUserSn;                  // 수정자
  DateTime? udtDt;                 // 수정 일시
  DateTime? delDt;                 // 삭제 일시

  String? documentColumnNm;        // 컬럼 이름
  String? documentColumnValue;     // 컬럼 값

  DocumentData({
    this.documentDataSn, this.documentSn, this.documentColumnSn, this.documentDataValue,
    this.param01, this.param02, this.param03, this.param04, this.param05,
    this.param06, this.param07, this.param08, this.param09, this.param10,
    this.crtUserSn, this.crtDt, this.udtUserSn, this.udtDt, this.delDt,
    this.documentColumnNm, this.documentColumnValue
  });

  DocumentData.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    documentDataSn = intFromJson(json, 'document_data_sn');
    documentSn = intFromJson(json, 'document_sn');
    documentColumnSn = intFromJson(json, 'document_column_sn');
    documentDataValue = stringFromJson(json, 'document_data_value');
    param01 = stringFromJson(json, 'param_01');
    param02 = stringFromJson(json, 'param_02');
    param03 = stringFromJson(json, 'param_03');
    param04 = stringFromJson(json, 'param_04');
    param05 = stringFromJson(json, 'param_05');
    param06 = stringFromJson(json, 'param_06');
    param07 = stringFromJson(json, 'param_07');
    param08 = stringFromJson(json, 'param_08');
    param09 = stringFromJson(json, 'param_09');
    param10 = stringFromJson(json, 'param_10');

    crtUserSn = intFromJson(json, 'crt_user_sn');
    crtDt = dateFromJson(json, 'crt_dt');
    udtUserSn = intFromJson(json, 'udt_user_sn');
    udtDt = dateFromJson(json, 'udt_dt');
    delDt = dateFromJson(json, 'del_dt');

    documentColumnNm = stringFromJson(json, 'document_column_nm');
    documentColumnValue = stringFromJson(json, 'document_column_value');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['document_data_sn'] = this.documentDataSn;
    data['document_sn'] = this.documentSn;
    data['document_column_sn'] = this.documentColumnSn;
    data['document_data_value'] = this.documentDataValue;
    data['param_01'] = this.param01;
    data['param_02'] = this.param02;
    data['param_03'] = this.param03;
    data['param_04'] = this.param04;
    data['param_05'] = this.param05;
    data['param_06'] = this.param06;
    data['param_07'] = this.param07;
    data['param_08'] = this.param08;
    data['param_09'] = this.param09;
    data['param_10'] = this.param10;

    data['crt_user_sn'] = this.crtUserSn;
    data['crt_dt'] = this.crtDt;
    data['udt_user_sn'] = this.udtUserSn;
    data['udt_dt'] = this.udtDt;
    data['del_dt'] = this.delDt;

    data['document_column_nm'] = this.documentColumnNm;
    data['document_column_value'] = this.documentColumnValue;
    return data;
  }
}