import 'package:json_annotation/json_annotation.dart';
part 'PaginatorInfo.g.dart';

@JsonSerializable()
class PaginatorInfo {
  factory PaginatorInfo.fromJson(json) => _$PaginatorInfoFromJson(json);

  PaginatorInfo(
    this.count,
    this.currentPage,
    this.firstItem,
    this.hasMorePages,
    this.lastItem,
    this.lastPage,
    this.perPage,
    this.total,
  );

  List<int?> count;

  List<int?> currentPage;

  List<int> firstItem;

  List<bool?> hasMorePages;

  List<int> lastItem;

  List<int?> lastPage;

  List<int?> perPage;

  List<int?> total;

  Map<String, dynamic> toJson() => _$PaginatorInfoToJson(this);
}
