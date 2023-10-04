import 'package:get/get.dart';
import 'package:nextflow_flutter_getx_profiles_api/models/profile_model/profile_model.dart';

class ProfileController extends GetxController {
  var loading = true.obs;

  loadDataFromWebAPI() async {
    loading(true);

    // delay 3 seconds
    await Future.delayed(Duration(seconds: 3));

    loading(false);
  }
}
