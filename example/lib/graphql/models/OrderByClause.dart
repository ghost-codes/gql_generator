import 'package:json_annotation/json_annotation.dart';
part 'OrderByClause.g.dart';

@JsonSerializable()
class OrderByClause {
  factory OrderByClause.fromJson(json) => _$OrderByClauseFromJson(json);

  OrderByClause();

  Map<String, dynamic> toJson() => _$OrderByClauseToJson(this);
}
