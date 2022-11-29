import 'package:build/build.dart';
import 'package:dio/dio.dart';
import 'package:gql_generator/src/network.dart';

class DataProcessor {
  /// Requests will timeout in [30] seconds when
  /// waiting on server for response
  static const int CONNECT_TIME_OUT = 60000;
  static const int RECEIVE_TIME_OUT = 60000;

  static fetchSchema(String link) async {
    final _dioOptions = BaseOptions(
      connectTimeout: CONNECT_TIME_OUT,
      receiveTimeout: RECEIVE_TIME_OUT,
      baseUrl: link,
    );
    Dio _dio = Dio(_dioOptions);

    final String queryRequest = r"""fragment FullType on __Type {
  kind
  name
  fields(includeDeprecated: true) {
    name
    args {
      ...InputValue
    }
    type {
      ...TypeRef
    }
    isDeprecated
    deprecationReason
  }
  inputFields {
    ...InputValue
  }
  interfaces {
    ...TypeRef
  }
  enumValues(includeDeprecated: true) {
    name
    isDeprecated
    deprecationReason
  }
  possibleTypes {
    ...TypeRef
  }
}
fragment InputValue on __InputValue {
  name
  type {
    ...TypeRef
  }
  defaultValue
}
fragment TypeRef on __Type {
  kind
  name
  ofType {
    kind
    name
    ofType {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
              }
            }
          }
        }
      }
    }
  }
}
query IntrospectionQuery {
  __schema {
    queryType {
      name
    }
    mutationType {
      name
    }
    types {
      ...FullType
    }
    directives {
      name
      locations
      args {
        ...InputValue
      }
    }
  }
}""";

    try {
      var response = await _post({
        'query': queryRequest,
        'variables': {},
        // if (request.operationName != null) 'operationName': request.operationName,
      }, _dio);
      return response;
    } on NetworkError catch (e) {
      throw UnresolvableAssetException(
          "Network call on $link return error of ${e.message}");
    }
  }

  static Future<T?> _post<T>(Map<String, dynamic> body, Dio dio) async {
    try {
      final _result = await dio.post('', data: body);
      return _result.data;
    } on DioError catch (e) {
      throw NetworkError.fromDio(e);
    }
  }
}

class NetworkError implements Exception {
  /// Constructor
  NetworkError(
    this.message, {
    Error? error,
    rawLog,
  }) {
    if (error?.fields != null) {
      fullError = error!.fields!
          .map((e) => '${e.field} ${e.message}')
          .join('\n\n-')
          .trim();
      rawResponse = error.toJson();
    }

    rawResponse = rawLog;
  }

  factory NetworkError.fromDio(DioError dioErr) {
    String? message;
    Error? _errr;

    switch (dioErr.type) {
      case DioErrorType.cancel:
        message = 'Request cancelled';
        break;
      case DioErrorType.sendTimeout:
      case DioErrorType.connectTimeout:
        message = 'Request timed out';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Response timed out';
        break;
      case DioErrorType.response:
        final _statusCode = dioErr.response!.statusCode!;
        if (_statusCode >= 200 && _statusCode < 400) {
          final _response = dioErr.response?.data;
          if (_response != null) _errr = Error.fromJson(_response);
        }
        message = dioErr.message;
        break;
      case DioErrorType.other:
        message = dioErr.message;
        break;
      default:
    }

    message ??= 'An unknown error occurred';

    if (message.contains('SocketException') ||
        message.contains('failed host lookup')) {
      message = 'A network error occurred. Please check your connection.';
    }

    return NetworkError(
      message,
      error: _errr,
      rawLog: dioErr.response?.data,
    );
  }

  /// This holds the reason why the request failed
  /// you can display this to the user
  String message;

  /// This holds the full error, assuming there're
  /// other parts especially `Validation` errors
  String? fullError;

  /// This is the full dump of the error from the server
  /// Useful for logging purposes
  dynamic rawResponse;

  Map<String, dynamic> toJson() => {
        'message': message,
        'fullError': fullError,
        'rawResponse': rawResponse.toString(),
      };
}
