import 'Country.dart';
import 'TripInviteePivot.dart';
import 'TravelerType.dart';
import 'Experience.dart';
import 'package:json_annotation/json_annotation.dart';
part 'TripInvitee.g.dart';

@JsonSerializable()
class TripInvitee {
  factory TripInvitee.fromJson(json) => _$TripInviteeFromJson(json);

  TripInvitee(
    this.email, {
    this.first_name,
    this.last_name,
    this.username,
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

  Country? country;

  TripInviteePivot? pivot;

  TravelerType? traveler_type;

  List<Experience>? experiences;

  String? avatar_url;

  DateTime? email_verified_at;

  DateTime? created_at;

  DateTime? updated_at;

  Map<String, dynamic> toJson() => _$TripInviteeToJson(this);
}
