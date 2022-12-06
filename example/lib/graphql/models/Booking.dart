import 'User.dart';
import 'Tour.dart';
import 'PaymentMethod.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Booking.g.dart';

@JsonSerializable()
class Booking {
  factory Booking.fromJson(json) => _$BookingFromJson(json);

  Booking(
    this.payee,
    this.tour,
    this.persons_count,
    this.payment_method,
    this.created_at,
    this.updated_at, {
    this.paid_amount,
  });

  User payee;

  Tour tour;

  double? paid_amount;

  int persons_count;

  PaymentMethod payment_method;

  DateTime created_at;

  DateTime updated_at;

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
