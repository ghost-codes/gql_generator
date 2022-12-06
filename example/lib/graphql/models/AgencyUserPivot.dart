import 'package:json_annotation/json_annotation.dart';
part 'AgencyUserPivot.g.dart';

@JsonSerializable()
class AgencyUserPivot {
  factory AgencyUserPivot.fromJson(json) => _$AgencyUserPivotFromJson(json);

  AgencyUserPivot({this.is_owner});

  bool? is_owner;

  Map<String, dynamic> toJson() => _$AgencyUserPivotToJson(this);
}
