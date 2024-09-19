import 'package:get/get.dart';

class ProfileController extends GetxController {

  var loading = false.obs;

  void loadDataFromWebAPI() async {
    loading.value = true;

    await Future.delayed(Duration(seconds: 3));
    loading.value = false;
  }
}
