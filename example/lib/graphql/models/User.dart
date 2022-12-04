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
    this.email,
    this.is_onboarding_complete, {
    this.first_name,
    this.last_name,
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
  });

  String? first_name;

  String? last_name;

  String email;

  String? username;

  Country? country;

  List<Agency>? agencies;

  AgencyUserPivot? pivot;

  TravelerType? traveler_type;

  List<Experience>? experiences;

  String? avatar_url;

  DateTime? email_verified_at;

  DateTime? created_at;

  DateTime? updated_at;

  bool is_onboarding_complete;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
