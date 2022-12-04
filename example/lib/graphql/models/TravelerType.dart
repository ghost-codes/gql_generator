import 'package:json_annotation/json_annotation.dart';
part 'TravelerType.g.dart';

@JsonSerializable()
class TravelerType {
  factory TravelerType.fromJson(json) => _$TravelerTypeFromJson(json);

  TravelerType(
    this.id,
    this.name,
  );

  List<String?> id;

  List<String?> name;

  Map<String, dynamic> toJson() => _$TravelerTypeToJson(this);
}
