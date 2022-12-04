import 'Country.dart';
import 'TripInviteePivot.dart';
import 'Tour.dart';
import 'TravelerType.dart';
import 'Experience.dart';
import 'package:json_annotation/json_annotation.dart';
part 'TripInvitee.g.dart';

@JsonSerializable()
class TripInvitee {
  factory TripInvitee.fromJson(json) => _$TripInviteeFromJson(json);

  TripInvitee(
    this.first_name,
    this.last_name,
    this.email,
    this.username,
    this.country,
    this.pivot,
    this.traveler_type,
    this.experiences,
    this.avatar_url,
    this.email_verified_at,
    this.created_at,
    this.updated_at, {
    this.bookings,
  });

  List<String> first_name;

  List<String> last_name;

  List<String?> email;

  List<String> username;

  List<Country> country;

  List<TripInviteePivot> pivot;

  List<Tour>? bookings;

  List<TravelerType> traveler_type;

  List<Experience> experiences;

  List<String> avatar_url;

  List<DateTime> email_verified_at;

  List<DateTime> created_at;

  List<DateTime> updated_at;

  Map<String, dynamic> toJson() => _$TripInviteeToJson(this);
}
