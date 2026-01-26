import 'package:dio/dio.dart';
import 'package:alasfor/core/constants/routes.dart';
import 'package:alasfor/core/network/network_dio_client.dart';

class NewProductsApi {
  final Dio _dio;

  NewProductsApi({Dio? dio}) : _dio = dio ?? DioClient().dio;

  Future<Response> getNewProducts() async {
    final response = await _dio.get(newProductsRoute);
    return response;
  }
}
