import 'dart:async';

import 'package:build/build.dart';
import 'package:gql_generator/src/dataProcessor.dart';
import 'package:yaml/yaml.dart';

class ModelBuilder extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    // await DataProcessor.fetchSchema(doc["endpoint"]);
  }

  @override
  // TODO: implement buildExtensions
  Map<String, List<String>> get buildExtensions => {
        ".dart": [".g.dart"]
      };
}
