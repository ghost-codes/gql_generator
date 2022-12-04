import 'Permission.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Role.g.dart';

@JsonSerializable()
class Role {
  factory Role.fromJson(json) => _$RoleFromJson(json);

  Role(
    this.name, {
    this.permissions,
  });

  List<String?> name;

  List<Permission?>? permissions;

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
