import 'package:json_annotation/json_annotation.dart';
part 'AgencyCategory.g.dart';

@JsonSerializable()
class AgencyCategory {
  factory AgencyCategory.fromJson(json) => _$AgencyCategoryFromJson(json);

  AgencyCategory(
    this.id,
    this.name,
  );

  int id;

  String name;

  Map<String, dynamic> toJson() => _$AgencyCategoryToJson(this);
}
