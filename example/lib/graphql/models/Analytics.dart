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
    this.total_tours_count,
    this.completed_tours_count,
    this.upcoming_tours_count,
    this.query_range, {
    this.top_tours,
  });

  List<int?> wallet_balance;

  List<int?> total_earnings;

  List<int?> total_withdrawn;

  List<TopTour>? top_tours;

  List<int?> total_tours_count;

  List<int?> completed_tours_count;

  List<int?> upcoming_tours_count;

  List<String> query_range;

  Map<String, dynamic> toJson() => _$AnalyticsToJson(this);
}
