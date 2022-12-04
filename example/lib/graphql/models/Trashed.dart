import 'package:json_annotation/json_annotation.dart';
part 'Trashed.g.dart';

@JsonSerializable()
class Trashed {
  factory Trashed.fromJson(json) => _$TrashedFromJson(json);

  Trashed();

  Map<String, dynamic> toJson() => _$TrashedToJson(this);
}
