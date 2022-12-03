import 'package:json_annotation/json_annotation.dart';
part 'OrderByRelationAggregateFunction.g.dart';

@JsonSerializable()
class OrderByRelationAggregateFunction {
  factory OrderByRelationAggregateFunction.fromJson(json) =>
      _$OrderByRelationAggregateFunctionFromJson(json);

  OrderByRelationAggregateFunction();

  Map<String, dynamic> toJson() =>
      _$OrderByRelationAggregateFunctionToJson(this);
}
