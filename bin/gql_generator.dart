import 'dart:convert';
import 'dart:io';

import 'package:gql_generator/src/dataProcessor.dart';
import 'package:interact/interact.dart';
import 'package:yaml/yaml.dart';

Future<void> main(List<String> args) async {
  int indexOfFileLink = args.indexOf("-l") + 1;

  if (indexOfFileLink == 0) {
    throw "Please provide graphql link in order to generate files";
  }
  final link = args[indexOfFileLink];
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
}
