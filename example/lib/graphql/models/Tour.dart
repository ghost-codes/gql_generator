import 'Agency.dart';
import 'Tour.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Tour.g.dart';

@JsonSerializable()
class Tour {
  factory Tour.fromJson(json) => _$TourFromJson(json);

  Tour(
    this.name,
    this.slug,
    this.start_date,
    this.end_date,
    this.rate,
    this.description,
    this.destination,
    this.state,
    this.agency,
    this.is_featured,
    this.images,
    this.bookings, {
    this.itinerary,
    this.feature_start_date,
    this.feature_end_date,
  });

  String name;

  String slug;

  DateTime start_date;

  DateTime end_date;

  double rate;

  String description;

  String destination;

  String state;

  Map<String, dynamic>? itinerary;

  Agency agency;

  bool is_featured;

  DateTime? feature_start_date;

  DateTime? feature_end_date;

  List<String> images;

  List<Tour> bookings;

  Map<String, dynamic> toJson() => _$TourToJson(this);
}
