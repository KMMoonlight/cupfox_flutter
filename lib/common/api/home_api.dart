import 'package:cupfox/common/tools/request.dart';
import 'package:dio/dio.dart';

var token = '';

//获取token
Future<Response<String>> getToken() {
  return dio.request('', options: Options(method: 'GET'));
}

//获取媒体数据详情
Future<Response<String>> getMediaDetailData(String title) {
  var url = '/s/$title.json';
  return dio.request(url, options: Options(method: 'GET'));
}

Future<Response<String>> getFilterData(
    {required String category,
    required String type,
    required String area,
    required String age,
    required String order,
    required int start}) {
  return Dio(BaseOptions(baseUrl: 'https://api.cupfox.app/'))
      .request('api/v2/filter/',
          queryParameters: {
            "tags": category,
            "genres": type,
            "countries": area,
            "year_range": age,
            "sort": order == '近期热度' ? 'T' : 'S',
            "limit": 24,
            "start": start
          },
          options: Options(
            method: 'GET',
          ));
}

Future<Response<String>> getFilterPageData(
    {required String category,
    required String type,
    required String area,
    required String age,
    required String order}) {
  var url = '/filter/$category/$type/$area/$age/$order';

  return dio.request(url, options: Options(method: 'GET'));
}
