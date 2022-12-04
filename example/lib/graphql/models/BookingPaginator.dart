import 'PaginatorInfo.dart';
import 'Booking.dart';
import 'package:json_annotation/json_annotation.dart';
part 'BookingPaginator.g.dart';

@JsonSerializable()
class BookingPaginator {
  factory BookingPaginator.fromJson(json) => _$BookingPaginatorFromJson(json);

  BookingPaginator(
    this.paginatorInfo,
    this.data,
  );

  PaginatorInfo paginatorInfo;

  List<Booking> data;

  Map<String, dynamic> toJson() => _$BookingPaginatorToJson(this);
}
