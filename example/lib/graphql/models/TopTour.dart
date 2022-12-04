import 'package:json_annotation/json_annotation.dart';
part 'TopTour.g.dart';

@JsonSerializable()
class TopTour {
  factory TopTour.fromJson(json) => _$TopTourFromJson(json);

  TopTour(
    this.name,
    this.total_impressions,
    this.total_bookings,
  );

  String name;

  int total_impressions;

  int total_bookings;

  Map<String, dynamic> toJson() => _$TopTourToJson(this);
}
