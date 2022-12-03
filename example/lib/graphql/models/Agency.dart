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
    this.name,
    this.username,
    this.avatar_url,
    this.email,
    this.state,
    this.pivot,
    this.country,
    this.tour_categories, {
    this.members,
  });

  List<String> name;

  List<String> username;

  List<String> avatar_url;

  List<String?> email;

  List<String?> state;

  List<AgencyMember?>? members;

  List<AgencyUserPivot> pivot;

  List<Country> country;

  List<AgencyCategory> tour_categories;

  Map<String, dynamic> toJson() => _$AgencyToJson(this);
}
