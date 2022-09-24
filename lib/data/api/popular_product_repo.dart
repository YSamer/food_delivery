import 'package:food_delivery/components/utils/app_constants.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient
        .getDate(AppConstants.BASE_URL + AppConstants.POPULAR_PRODUCT_URL);
  }
}
