import 'package:json_annotation/json_annotation.dart';
part 'Experience.g.dart';

@JsonSerializable()
class Experience {
  factory Experience.fromJson(json) => _$ExperienceFromJson(json);

  Experience(
    this.id,
    this.name,
  );

  List<String?> id;

  List<String?> name;

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
