class GqlType {
  String kind;
  String? name;

  GqlType? ofType;

  GqlType(this.kind, this.name, this.ofType);

  factory GqlType.fromJson(Map<String, dynamic> json) {
    return GqlType(json["kind"] ?? "", json["name"],
        json["ofType"] != null ? GqlType.fromJson(json["ofType"]) : null);
  }
}
