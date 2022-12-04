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
    this.first_name,
    this.last_name,
    this.email,
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
  );

  List<String> first_name;

  List<String> last_name;

  List<String?> email;

  List<String> username;

  List<Role> roles;

  List<Country> country;

  List<AgencyUserPivot> pivot;

  List<TravelerType> traveler_type;

  List<Experience> experiences;

  List<String> avatar_url;

  List<DateTime> email_verified_at;

  List<DateTime> created_at;

  List<DateTime> updated_at;

  Map<String, dynamic> toJson() => _$AgencyMemberToJson(this);
}
