import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
    baseUrl: 'https://cupfox.app/',
    headers: {
      "User-Agent":
          'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'
    },
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5)));
