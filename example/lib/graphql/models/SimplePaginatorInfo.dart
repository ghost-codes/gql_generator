import 'package:json_annotation/json_annotation.dart';
part 'SimplePaginatorInfo.g.dart';

@JsonSerializable()
class SimplePaginatorInfo {
  factory SimplePaginatorInfo.fromJson(json) =>
      _$SimplePaginatorInfoFromJson(json);

  SimplePaginatorInfo(
    this.count,
    this.currentPage,
    this.perPage,
    this.hasMorePages, {
    this.firstItem,
    this.lastItem,
  });

  int count;

  int currentPage;

  int? firstItem;

  int? lastItem;

  int perPage;

  bool hasMorePages;

  Map<String, dynamic> toJson() => _$SimplePaginatorInfoToJson(this);
}
