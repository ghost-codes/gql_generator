import 'Agency.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MyTrip.g.dart';

@JsonSerializable()
class MyTrip {
  factory MyTrip.fromJson(json) => _$MyTripFromJson(json);

  MyTrip(
    this.name,
    this.slug,
    this.start_date,
    this.end_date,
    this.description,
    this.destination,
    this.travel_type, {
    this.rate,
    this.state,
    this.itinerary,
    this.agency,
    this.images,
  });

  String name;

  String slug;

  DateTime start_date;

  DateTime end_date;

  double? rate;

  String description;

  String destination;

  String? state;

  Map<String, dynamic>? itinerary;

  Agency? agency;

  List<String>? images;

  String travel_type;

  Map<String, dynamic> toJson() => _$MyTripToJson(this);
}
