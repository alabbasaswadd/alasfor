import 'package:alasfor/core/constants/routes.dart';
import 'package:dio/dio.dart';

class NewProductsApi {
  Dio dio = Dio();

  Future<Response> getNewProducts() async {
    try {
      final response = await dio.get(newProductsRoute);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
