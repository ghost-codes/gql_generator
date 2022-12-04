import 'TripInvitee.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Trip.g.dart';

@JsonSerializable()
class Trip {
  factory Trip.fromJson(json) => _$TripFromJson(json);

  Trip(
    this.name,
    this.slug,
    this.invitees, {
    this.description,
    this.destination,
    this.itinerary,
    this.start_date,
    this.end_date,
  });

  String name;

  String slug;

  String? description;

  String? destination;

  Map<String, dynamic>? itinerary;

  DateTime? start_date;

  DateTime? end_date;

  List<TripInvitee> invitees;

  Map<String, dynamic> toJson() => _$TripToJson(this);
}
