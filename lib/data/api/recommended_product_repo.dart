import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<dynamic> getRecommendedProductList() async {
    return await apiClient
        .getDate(AppConstants.BASE_URL + AppConstants.RECOMMENDED_PRODUCT_URL);
  }
}
