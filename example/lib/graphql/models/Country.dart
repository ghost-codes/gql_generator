import 'package:json_annotation/json_annotation.dart';
part 'Country.g.dart';

@JsonSerializable()
class Country {
  factory Country.fromJson(json) => _$CountryFromJson(json);

  Country(
    this.id,
    this.name,
    this.citizenship,
    this.country_code,
    this.iso_3166_2,
    this.iso_3166_3,
    this.region_code,
    this.sub_region_code,
    this.eea,
    this.calling_code, {
    this.capital,
    this.currency,
    this.currency_code,
    this.currency_sub_unit,
    this.currency_symbol,
    this.currency_decimals,
    this.full_name,
    this.flag,
  });

  String id;

  String name;

  String? capital;

  String citizenship;

  String country_code;

  String? currency;

  String? currency_code;

  String? currency_sub_unit;

  String? currency_symbol;

  int? currency_decimals;

  String? full_name;

  String iso_3166_2;

  String iso_3166_3;

  String region_code;

  String sub_region_code;

  String eea;

  String calling_code;

  String? flag;

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
