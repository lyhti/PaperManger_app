import './model.dart';

class Global extends Model {
  String? baseUrl;
  String? apiPath;
  String? apiFilePath;
  String? mode;

  Global({this.baseUrl, this.apiPath, this.apiFilePath, this.mode});

  Global.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    baseUrl = json['base_url'].toString();
    apiPath = json['api_path'].toString();
    apiFilePath = json['api_file_path'].toString();
    mode = stringFromJson(json, 'mode');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['base_url'] = this.baseUrl;
    data['api_path'] = this.apiPath;
    data['api_file_path'] = this.apiFilePath;
    data['mode'] = this.mode;
    return data;
  }
}
