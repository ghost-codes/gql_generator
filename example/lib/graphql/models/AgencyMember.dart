import 'Role.dart';
import 'Country.dart';
import 'AgencyUserPivot.dart';
import 'TravelerType.dart';
import 'Experience.dart';
import 'package:json_annotation/json_annotation.dart';
part 'AgencyMember.g.dart';

@JsonSerializable()
class AgencyMember {
  factory AgencyMember.fromJson(json) => _$AgencyMemberFromJson(json);

  AgencyMember(
    this.email, {
    this.first_name,
    this.last_name,
    this.username,
    this.roles,
    this.country,
    this.pivot,
    this.traveler_type,
    this.experiences,
    this.avatar_url,
    this.email_verified_at,
    this.created_at,
    this.updated_at,
  });

  String? first_name;

  String? last_name;

  String email;

  String? username;

  List<Role>? roles;

  Country? country;

  AgencyUserPivot? pivot;

  TravelerType? traveler_type;

  List<Experience>? experiences;

  String? avatar_url;

  DateTime? email_verified_at;

  DateTime? created_at;

  DateTime? updated_at;

  Map<String, dynamic> toJson() => _$AgencyMemberToJson(this);
}
