import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://fakestoreapi.com",
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) async {
          String errorMessage;
          if (e.type == DioExceptionType.connectionTimeout) {
            errorMessage = "فشل الاتصال بالسيرفر، تحقق من الانترنت";
          } else if (e.type == DioExceptionType.receiveTimeout) {
            errorMessage = "انتهت مهلة الاستجابة";
          } else if (e.response?.statusCode == 401) {
            errorMessage = "غير مصرح، الرجاء تسجيل الدخول";
          } else if (e.response?.statusCode == 500) {
            errorMessage = "خطأ في السيرفر";
          } else {
            errorMessage = e.message ?? "حدث خطأ غير معروف";
          }
          return handler.reject(
            DioException(
              requestOptions: e.requestOptions,
              error: errorMessage,
              response: e.response,
              type: e.type,
            ),
          );
        },
      ),
    );
  }
}
