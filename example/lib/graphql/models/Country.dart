import 'package:json_annotation/json_annotation.dart';
part 'Country.g.dart';

@JsonSerializable()
class Country {
  factory Country.fromJson(json) => _$CountryFromJson(json);

  Country(
    this.id,
    this.name,
    this.capital,
    this.citizenship,
    this.country_code,
    this.currency,
    this.currency_code,
    this.currency_sub_unit,
    this.currency_symbol,
    this.currency_decimals,
    this.full_name,
    this.iso_3166_2,
    this.iso_3166_3,
    this.region_code,
    this.sub_region_code,
    this.eea,
    this.calling_code,
    this.flag,
  );

  List<String?> id;

  List<String?> name;

  List<String> capital;

  List<String?> citizenship;

  List<String?> country_code;

  List<String> currency;

  List<String> currency_code;

  List<String> currency_sub_unit;

  List<String> currency_symbol;

  List<int> currency_decimals;

  List<String> full_name;

  List<String?> iso_3166_2;

  List<String?> iso_3166_3;

  List<String?> region_code;

  List<String?> sub_region_code;

  List<String?> eea;

  List<String?> calling_code;

  List<String> flag;

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
