import 'User.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Entry.g.dart';

@JsonSerializable()
class Entry {
  factory Entry.fromJson(json) => _$EntryFromJson(json);

  Entry(
    this.user,
    this.token,
    this.is_social,
  );

  List<User?> user;

  List<String?> token;

  List<bool?> is_social;

  Map<String, dynamic> toJson() => _$EntryToJson(this);
}
