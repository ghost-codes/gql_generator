import 'package:json_annotation/json_annotation.dart';
part 'OrderByRelationWithColumnAggregateFunction.g.dart';

@JsonSerializable()
class OrderByRelationWithColumnAggregateFunction {
  factory OrderByRelationWithColumnAggregateFunction.fromJson(json) =>
      _$OrderByRelationWithColumnAggregateFunctionFromJson(json);

  OrderByRelationWithColumnAggregateFunction();

  Map<String, dynamic> toJson() =>
      _$OrderByRelationWithColumnAggregateFunctionToJson(this);
}
