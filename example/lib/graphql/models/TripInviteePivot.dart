import 'package:json_annotation/json_annotation.dart';
part 'TripInviteePivot.g.dart';

@JsonSerializable()
class TripInviteePivot {
  factory TripInviteePivot.fromJson(json) => _$TripInviteePivotFromJson(json);

  TripInviteePivot(this.is_creator);

  List<bool> is_creator;

  Map<String, dynamic> toJson() => _$TripInviteePivotToJson(this);
}
