import 'package:json_annotation/json_annotation.dart';
part 'PageInfo.g.dart';

@JsonSerializable()
class PageInfo {
  factory PageInfo.fromJson(json) => _$PageInfoFromJson(json);

  PageInfo(
    this.hasNextPage,
    this.hasPreviousPage,
    this.startCursor,
    this.endCursor,
    this.total,
    this.count,
    this.currentPage,
    this.lastPage,
  );

  List<bool?> hasNextPage;

  List<bool?> hasPreviousPage;

  List<String> startCursor;

  List<String> endCursor;

  List<int?> total;

  List<int?> count;

  List<int?> currentPage;

  List<int?> lastPage;

  Map<String, dynamic> toJson() => _$PageInfoToJson(this);
}
