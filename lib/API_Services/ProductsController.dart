// ignore_for_file: deprecated_member_use
import 'package:get/get.dart';
import 'package:kamran/API_Services/ApiService.dart';
import 'package:kamran/API_Services/ProductsApi.dart';


class ProductController extends GetxController {
  var isLoading = true.obs;
  var productlist = List<Product>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteService.fetchproduct();
      if (products != null) {
        productlist.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
