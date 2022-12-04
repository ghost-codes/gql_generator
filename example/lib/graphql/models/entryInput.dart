import 'package:json_annotation/json_annotation.dart';
part 'entryInput.g.dart';

@JsonSerializable()
class entryInput {
  factory entryInput.fromJson(json) => _$entryInputFromJson(json);

  entryInput();

  Map<String, dynamic> toJson() => _$entryInputToJson(this);
}
