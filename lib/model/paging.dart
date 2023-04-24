import './model.dart';

/**
 * 페이징 모델
 */
class Paging extends Model {
  int? currentPage;
  int? lastPage = 1;
  int? perPage;            // 페이지당 컨텐츠 수
  int? total;              // 전체 컨텐츠 수
  int? from;               // 총 컨텐츠 중 현재 컨텐츠 시작번호
  int? to;                 // 총 컨텐츠 중 현재 컨텐츠 끝번호

  Paging({
    this.currentPage, this.lastPage, this.perPage, this.total, this.from, this.to
  });

  Paging.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    currentPage = intFromJson(json, 'current_page');
    lastPage = intFromJson(json, 'last_page');
    perPage = intFromJson(json, 'per_page');
    total = intFromJson(json, 'total');
    from = intFromJson(json, 'from');
    to = intFromJson(json, 'to');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}