import 'package:json_annotation/json_annotation.dart';
part 'SortOrder.g.dart';

@JsonSerializable()
class SortOrder {
  factory SortOrder.fromJson(json) => _$SortOrderFromJson(json);

  SortOrder();

  Map<String, dynamic> toJson() => _$SortOrderToJson(this);
}
