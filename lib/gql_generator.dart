library gql_generator;

import 'dart:io';

import 'package:build/build.dart';
import 'package:gql_generator/src/modelBuilder.dart';

Builder gqlGenerator(BuilderOptions options) {
  // throw UnresolvableAssetException("Network call on  return error of ");

  //  options.
  //  final file = File( "graphql_config.yaml");
  //  if(!(await file.exists()))
  //   final doc = loadYaml("", sourceUrl: Uri.parse("./graphql.yaml"));
  //   print(doc);
  return ModelBuilder();
}
