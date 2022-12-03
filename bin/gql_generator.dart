import 'dart:io';

import 'package:gql_generator/src/util.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:built_collection/built_collection.dart';

Future<void> main(List<String> args) async {
  int indexOfFileLink = args.indexOf("-l") + 1;

  if (indexOfFileLink == 0) {
    throw "Please provide graphql endpoint in order to generate files";
  }
  final link = args[indexOfFileLink];

  // Fetch schema using Network client
  final result = await fetchSchema(link);

// Process models and gen-code
  await processModels(result);
}

Future<void> processModels(Map<String, dynamic> schema) async {
  final graqhqlDir = await Directory("lib/graphql/models").create();

  final models = (schema["data"]["__schema"]["types"] as List).where(
    (element) => (element["kind"] != "SCALAR" &&
        element["name"] != "Query" &&
        element["name"] != "Mutation"),
  );

  final files = models.map((e) {
    if ((e["name"] as String).startsWith("__")) return;

    Library library = Library((builder) {
      final fields = ((e["fields"] ?? []) as List)
          .map(
            (element) {
              final x = FieldBuilder(element["name"], Type.fromJson(element["type"]),
                  (name) => builder.directives.add(Directive.import("$name.dart")));
              if ((element["name"] as String).startsWith("__")) return null;
              return x.toField();
            },
          )
          .where((element) => element != null)
          .toList();
      builder.directives.add(Directive.import("package:json_annotation/json_annotation.dart"));

      final requiredParams = fields
          .where((element) => !(element!.type?.symbol?.endsWith("?") ?? false))
          .map((element) =>
              Parameter((paramBuilder) => paramBuilder..name = "this.${element!.name}"));

      final optionParams = fields
          .where((element) => element!.type?.symbol?.endsWith("?") ?? false)
          .map((e) => Parameter((paramBuilder) => paramBuilder
            ..name = "this.${e!.name}"
            ..named = true));

      builder.body.addAll([
        Class((b) => b
          ..name = e["name"]
          ..annotations = ListBuilder([refer('JsonSerializable()')])
          ..fields = ListBuilder(fields)
          ..methods = ListBuilder([
            Method((methodBuilder) => methodBuilder
              ..body = Code("_\$${b.name}ToJson(this)")
              ..lambda = true
              ..name = "toJson"
              ..returns = refer("Map<String,dynamic>"))
          ])
          ..constructors = ListBuilder([
            Constructor((builder) => builder
              ..factory = true
              ..name = 'fromJson'
              ..lambda = true
              ..requiredParameters = ListBuilder([Parameter((builder) => builder.name = 'json')])
              ..body = Code('_\$${b.name}FromJson(json)')),
            Constructor((builder) => builder
              ..requiredParameters = ListBuilder(requiredParams)
              ..optionalParameters = ListBuilder(optionParams))
          ]))
      ]);

      builder.directives.add(Directive.part("${e["name"]}.g.dart"));
    });
    // final c = Class((b) => b
    //   ..name = e["name"]
    //   ..fields =
    //       ListBuilder((e["fields"] ?? []).map((element) => Field((field) {
    //             field.name = element["name"];
    //             // if (element) {
    //             final type = element["type"];
    //             if (type["kind"] == "SCALAR") {
    //               field.type = Reference("${scalarMap[type["name"]]}?");
    //               // }
    //             } else if (type["kind"] == "NON_NULL" &&
    //                 type["ofType"]["kind"] == "SCALAR") {
    //               field.type = Reference(scalarMap[type["ofType"]["name"]]);
    //             }
    //           })))
    //   ..constructors = ListBuilder([
    //     Constructor((builder) => builder
    //       ..factory = true
    //       ..name = 'fromJson'
    //       ..lambda = true
    //       ..requiredParameters =
    //           ListBuilder([Parameter((builder) => builder.name = 'json')])
    //       ..body = Code('_\$${b.name}ToJson(json)'))
    //   ]));

    final emitter = DartEmitter();
    final File file = File("${graqhqlDir.path}/${e["name"]}.dart");
    file.writeAsStringSync(DartFormatter().format('${library.accept(emitter)}'));
  }).toList();
}

class FieldBuilder {
  final String name;
  final Type type;
  final Function(String name) import;

  String listStringConst(String t) {
    return "List<$t>";
  }

  FieldBuilder(this.name, this.type, this.import);

  Reference scalarReferenceBuilder(String type, {bool isNull = false, bool isList = false}) {
    final ref = "${scalarMap[type]}${isNull ? "?" : ""}";
    return Reference(isList ? ref : listStringConst(ref));
  }

  Reference objectReferenceBuilder(String type, {bool isNull = false, bool isList = false}) {
    final ref = "$type${isNull ? "?" : ""}";
    return Reference(isList ? ref : listStringConst(ref));
  }

  Reference? constructType(Type type, {bool isNull = false}) {
    switch (type.kind) {
      case "NON_NULL":
        return constructType(type.ofType!, isNull: true);
      case "SCALAR":
        return scalarReferenceBuilder(type.name!, isNull: isNull);
      case "OBJECT":
        if (type.name == "__Directive") return null;
        import(type.name!);
        return objectReferenceBuilder(type.name!, isNull: isNull);
      case "LIST":
        if (isNull) {
          final result = constructType(type.ofType!, isNull: false);
          return Reference(result == null ? "dynamice" : "${result.symbol}?");
        }
        return constructType(type.ofType!, isNull: false);

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

class Type {
  String kind;
  String? name;

  Type? ofType;

  Type(this.kind, this.name, this.ofType);

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(json["kind"] ?? "", json["name"],
        json["ofType"] != null ? Type.fromJson(json["ofType"]) : null);
  }
}
