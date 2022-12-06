import 'package:code_builder/code_builder.dart';
import 'package:gql_generator/src/gqlType.dart';
import 'package:gql_generator/src/util.dart';

class FieldProcessor {
  final String name;
  final GqlType type;
  final Function(String name) import;

  String listStringConst(String t) {
    return "List<$t>";
  }

  FieldProcessor(this.name, this.type, this.import);

  Reference scalarReferenceBuilder(String type, {bool isNull = false, bool isList = false}) {
    final ref = "${scalarMap[type]}${isNull ? "?" : ""}";
    return Reference(isList ? listStringConst(ref) : ref);
  }

  Reference objectReferenceBuilder(String type, {bool isNull = false, bool isList = false}) {
    final ref = "$type${isNull ? "?" : ""}";
    return Reference(isList ? listStringConst(ref) : ref);
  }

  Reference? constructType(GqlType type, {bool isNull = true, bool isList = false}) {
    switch (type.kind) {
      case "NON_NULL":
        return constructType(type.ofType!, isNull: false, isList: isList);
      case "SCALAR":
        return scalarReferenceBuilder(type.name!, isNull: isNull, isList: isList);
      case "OBJECT":
        if (type.name == "__Directive") return null;
        import(type.name!);
        return objectReferenceBuilder(type.name!, isNull: isNull, isList: isList);
      case "LIST":
        if (isNull) {
          final result = constructType(type.ofType!, isNull: false, isList: true);
          return Reference(result == null ? "dynamic" : "${result.symbol}?");
        }
        return constructType(type.ofType!, isNull: false, isList: true);

      default:
        return null;
    }
  }

  Field toField() {
    return Field((field) {
      field.name = name;
      field.type = constructType(type);
    });
  }
}
