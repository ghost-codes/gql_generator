import 'PaginatorInfo.dart';
import 'Tour.dart';
import 'package:json_annotation/json_annotation.dart';
part 'TourPaginator.g.dart';

@JsonSerializable()
class TourPaginator {
  factory TourPaginator.fromJson(json) => _$TourPaginatorFromJson(json);

  TourPaginator(
    this.paginatorInfo, {
    this.data,
  });

  List<PaginatorInfo?> paginatorInfo;

  List<Tour?>? data;

  Map<String, dynamic> toJson() => _$TourPaginatorToJson(this);
}
