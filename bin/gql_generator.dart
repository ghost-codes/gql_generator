import 'dart:convert';
import 'dart:io';

import 'package:gql_generator/src/dataProcessor.dart';
import 'package:interact/interact.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:built_collection/built_collection.dart';

Future<void> main(List<String> args) async {
  int indexOfFileLink = args.indexOf("-l") + 1;

  if (indexOfFileLink == 0) {
    throw "Please provide graphql link in order to generate files";
  }
  final link = args[indexOfFileLink];

  // Fetch schema using Network client
  final result = await fetchSchema(link);

// Process models and gen-code
  await processModels(result);
}

Future<void> processModels(Map<String, dynamic> schema) async {
  final models = (schema["data"]["__schema"]["types"] as List).where(
    (element) => (element["kind"] != "SCALAR" &&
        element["name"] != "Query" &&
        element["name"] != "Mutation"),
  );

  final files = models.map((e) {
    final c = Class((b) => b
      ..name = e["name"]
      ..fields = ListBuilder([
        Field(
          (p0) => p0
            ..type = Reference("int?")
            ..name = "a",
        )
      ])
      ..constructors = ListBuilder([
        Constructor((builder) => builder
          ..factory = true
          ..name = 'fromJson'
          ..lambda = true
          ..requiredParameters =
              ListBuilder([Parameter((builder) => builder.name = 'json')])
          ..body = Code('_\$${b.name}ToJson(json)'))
      ]));
    final emitter = DartEmitter();
    print(DartFormatter().format('${c.accept(emitter)}'));
  }).toList();
}

Future<Map<String, dynamic>> fetchSchema(String link) async {
  final loading = Spinner(
    icon: '🏆',
    leftPrompt: (done) => '', // prompts are optional
    rightPrompt: (done) => done
        ? 'here is a trophy for being patient'
        : 'searching a thing for you',
  ).interact();
  final result = await DataProcessor.fetchSchema(link);
  File file = File("../graphql_meta_data.json");
  await file.writeAsString(json.encode(result));
  loading.done();

  return (json.encode(result) as Map<String, dynamic>);
}
