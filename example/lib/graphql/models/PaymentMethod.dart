import 'package:json_annotation/json_annotation.dart';
part 'PaymentMethod.g.dart';

@JsonSerializable()
class PaymentMethod {
  factory PaymentMethod.fromJson(json) => _$PaymentMethodFromJson(json);

  PaymentMethod(this.name);

  List<String?> name;

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
