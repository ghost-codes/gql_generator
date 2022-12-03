import 'TripInvitee.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Trip.g.dart';

@JsonSerializable()
class Trip {
  factory Trip.fromJson(json) => _$TripFromJson(json);

  Trip(
    this.name,
    this.slug,
    this.description,
    this.location,
    this.itinerary,
    this.start_date,
    this.end_date, {
    this.invitees,
  });

  List<String?> name;

  List<String?> slug;

  List<String> description;

  List<String> location;

  List<Map<String, dynamic>> itinerary;

  List<DateTime> start_date;

  List<DateTime> end_date;

  List<TripInvitee>? invitees;

  Map<String, dynamic> toJson() => _$TripToJson(this);
}
