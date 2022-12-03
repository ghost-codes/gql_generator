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
    this.itinerary,
    this.agency,
    this.is_featured,
    this.feature_start_date,
    this.feature_end_date, {
    this.images,
    this.bookings,
  });

  List<String?> name;

  List<String?> slug;

  List<DateTime?> start_date;

  List<DateTime?> end_date;

  List<double?> rate;

  List<String?> description;

  List<String?> destination;

  List<String?> state;

  List<Map<String, dynamic>> itinerary;

  List<Agency?> agency;

  List<bool?> is_featured;

  List<DateTime> feature_start_date;

  List<DateTime> feature_end_date;

  List<String?>? images;

  List<Tour>? bookings;

  Map<String, dynamic> toJson() => _$TourToJson(this);
}
