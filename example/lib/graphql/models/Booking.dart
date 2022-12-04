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
    this.paid_amount,
    this.persons_count,
    this.payment_method,
    this.created_at,
    this.updated_at,
  );

  List<User?> payee;

  List<Tour?> tour;

  List<double> paid_amount;

  List<int?> persons_count;

  List<PaymentMethod?> payment_method;

  List<DateTime?> created_at;

  List<DateTime?> updated_at;

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
