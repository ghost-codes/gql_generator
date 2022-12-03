import 'Country.dart';
import 'Agency.dart';
import 'AgencyUserPivot.dart';
import 'TravelerType.dart';
import 'Experience.dart';
import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()
class User {
  factory User.fromJson(json) => _$UserFromJson(json);

  User(
    this.first_name,
    this.last_name,
    this.email,
    this.username,
    this.country,
    this.agencies,
    this.pivot,
    this.traveler_type,
    this.experiences,
    this.avatar_url,
    this.email_verified_at,
    this.created_at,
    this.updated_at,
    this.is_onboarding_complete,
  );

  List<String> first_name;

  List<String> last_name;

  List<String?> email;

  List<String> username;

  List<Country> country;

  List<Agency> agencies;

  List<AgencyUserPivot> pivot;

  List<TravelerType> traveler_type;

  List<Experience> experiences;

  List<String> avatar_url;

  List<DateTime> email_verified_at;

  List<DateTime> created_at;

  List<DateTime> updated_at;

  List<bool?> is_onboarding_complete;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
