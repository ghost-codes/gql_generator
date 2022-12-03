import 'dart:convert';
import 'dart:io';

import 'package:gql_generator/src/dataProcessor.dart';
import 'package:interact/interact.dart';

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

  return ((result) as Map<String, dynamic>);
}

Map<String, String> scalarMap = {
  "String": "String",
  "Boolean": "bool",
  "Int": "int",
  "ID": "String",
  "Float": "double",
  "DateTime": "DateTime",
  "Date": "DateTime",
  "JSON": "Map<String,dynamic>",
};
