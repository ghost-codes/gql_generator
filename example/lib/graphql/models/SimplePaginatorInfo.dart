import 'package:json_annotation/json_annotation.dart';
part 'SimplePaginatorInfo.g.dart';

@JsonSerializable()
class SimplePaginatorInfo {
  factory SimplePaginatorInfo.fromJson(json) =>
      _$SimplePaginatorInfoFromJson(json);

  SimplePaginatorInfo(
    this.count,
    this.currentPage,
    this.firstItem,
    this.lastItem,
    this.perPage,
    this.hasMorePages,
  );

  List<int?> count;

  List<int?> currentPage;

  List<int> firstItem;

  List<int> lastItem;

  List<int?> perPage;

  List<bool?> hasMorePages;

  Map<String, dynamic> toJson() => _$SimplePaginatorInfoToJson(this);
}
