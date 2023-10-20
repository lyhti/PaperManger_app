import './model.dart';

///
/// sign task model
///

class SignTask extends Model {
  int? taskSn;                 // 문서일련번호
  int? sender;
  int? receiver;
  int? documentSn;
  String? taskDesc;
  String? signVarName;
  int? confirmed;
  String? taskStatus;
  DateTime? crtDt;                 // 생성 일시
  String? title;                   // 문서이름
  String? documentTypeNm;          // 문서종류
  String? userNm;                  // 작성자이름
  String? cstrnNm;


  SignTask({
    this.taskSn, this.sender, this.receiver, this.documentSn, this.taskDesc, this.signVarName,
    this.confirmed, this.taskStatus, this.crtDt, this.title, this.documentTypeNm, this.userNm, this.cstrnNm
  });

  SignTask.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    taskSn = intFromJson(json, 'task_sn');
    sender = intFromJson(json, 'sender');
    receiver = intFromJson(json, 'receiver');
    documentSn = intFromJson(json, 'document_sn');
    taskDesc = stringFromJson(json, 'task_desc');
    signVarName = stringFromJson(json, 'sign_var_name');
    confirmed = intFromJson(json, 'confirmed');
    taskStatus = stringFromJson(json, 'task_status');
    crtDt = dateFromJson(json, 'crt_dt');
    title = stringFromJson(json, 'title');
    documentTypeNm = stringFromJson(json, 'document_type_nm');
    userNm = stringFromJson(json, 'user_nm');
    cstrnNm = stringFromJson(json, 'document_data_value');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['task_sn'] = taskSn;
    data['sender'] = sender;
    data['receiver'] = receiver;
    data['document_sn'] = documentSn;
    data['task_desc'] = taskDesc;
    data['sign_var_name'] = signVarName;
    data['confirmed'] = confirmed;
    data['task_status'] = taskStatus;
    data['title'] = title;
    data['document_type_nm'] = documentTypeNm;
    data['user_nm'] = userNm;
    data['document_data_value'] = cstrnNm;

    return data;
  }
}