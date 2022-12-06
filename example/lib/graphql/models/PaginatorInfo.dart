import 'package:json_annotation/json_annotation.dart';
part 'PaginatorInfo.g.dart';

@JsonSerializable()
class PaginatorInfo {
  factory PaginatorInfo.fromJson(json) => _$PaginatorInfoFromJson(json);

  PaginatorInfo(
    this.count,
    this.currentPage,
    this.hasMorePages,
    this.lastPage,
    this.perPage,
    this.total, {
    this.firstItem,
    this.lastItem,
  });

  int count;

  int currentPage;

  int? firstItem;

  bool hasMorePages;

  int? lastItem;

  int lastPage;

  int perPage;

  int total;

  Map<String, dynamic> toJson() => _$PaginatorInfoToJson(this);
}
