import 'package:json_annotation/json_annotation.dart';
part 'PageInfo.g.dart';

@JsonSerializable()
class PageInfo {
  factory PageInfo.fromJson(json) => _$PageInfoFromJson(json);

  PageInfo(
    this.hasNextPage,
    this.hasPreviousPage,
    this.total,
    this.count,
    this.currentPage,
    this.lastPage, {
    this.startCursor,
    this.endCursor,
  });

  bool hasNextPage;

  bool hasPreviousPage;

  String? startCursor;

  String? endCursor;

  int total;

  int count;

  int currentPage;

  int lastPage;

  Map<String, dynamic> toJson() => _$PageInfoToJson(this);
}
