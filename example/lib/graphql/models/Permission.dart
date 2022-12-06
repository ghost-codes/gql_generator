import 'package:json_annotation/json_annotation.dart';
part 'Permission.g.dart';

@JsonSerializable()
class Permission {
  factory Permission.fromJson(json) => _$PermissionFromJson(json);

  Permission(this.name);

  String name;

  Map<String, dynamic> toJson() => _$PermissionToJson(this);
}
