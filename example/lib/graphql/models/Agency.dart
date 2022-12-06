import 'AgencyMember.dart';
import 'AgencyUserPivot.dart';
import 'Country.dart';
import 'AgencyCategory.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Agency.g.dart';

@JsonSerializable()
class Agency {
  factory Agency.fromJson(json) => _$AgencyFromJson(json);

  Agency(
    this.email,
    this.state,
    this.members, {
    this.name,
    this.username,
    this.avatar_url,
    this.pivot,
    this.country,
    this.tour_categories,
  });

  String? name;

  String? username;

  String? avatar_url;

  String email;

  String state;

  List<AgencyMember> members;

  AgencyUserPivot? pivot;

  Country? country;

  List<AgencyCategory>? tour_categories;

  Map<String, dynamic> toJson() => _$AgencyToJson(this);
}
