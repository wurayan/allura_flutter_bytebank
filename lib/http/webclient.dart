import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptors.dart';

const String baseUrl = 'http://192.168.2.190:8080/transactions';

http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()], requestTimeout: const Duration(seconds: 5));


