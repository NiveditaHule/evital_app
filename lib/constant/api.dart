import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API{
  Dio _dio = Dio();
  API(){
    _dio.options.baseUrl = "https://dev-api.evitalrx.in/v1/whitelabel/";
    _dio.interceptors.add(PrettyDioLogger());

  }
  Dio get sendRequest => _dio;
}