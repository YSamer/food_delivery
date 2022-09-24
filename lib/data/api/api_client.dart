import 'package:food_delivery/components/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset = UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getDate(String url) async {
    try {
      Response response =
          await get('https://mvs.bslmeiyu.com/api/v1/products/popular');
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
