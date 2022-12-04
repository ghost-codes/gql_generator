import 'TopTour.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Analytics.g.dart';

@JsonSerializable()
class Analytics {
  factory Analytics.fromJson(json) => _$AnalyticsFromJson(json);

  Analytics(
    this.wallet_balance,
    this.total_earnings,
    this.total_withdrawn,
    this.top_tours,
    this.total_tours_count,
    this.completed_tours_count,
    this.upcoming_tours_count, {
    this.query_range,
  });

  int wallet_balance;

  int total_earnings;

  int total_withdrawn;

  List<TopTour> top_tours;

  int total_tours_count;

  int completed_tours_count;

  int upcoming_tours_count;

  String? query_range;

  Map<String, dynamic> toJson() => _$AnalyticsToJson(this);
}
