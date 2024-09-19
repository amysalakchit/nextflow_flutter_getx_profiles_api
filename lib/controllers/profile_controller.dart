import 'package:get/get.dart';
import 'package:nextflow_flutter_getx_profiles_api/models/profile_model/profile_model.dart';

class ProfileController extends GetxController {
  var loading = false.obs;

  var profiles = <ProfileModel>[];

  void loadDataFromWebAPI() async {
    loading.value = true;

    var connect = Get.find<GetConnect>();

    var response = await connect
        .get('https://651d740c44e393af2d59d2b4.mockapi.io/api/profiles');

    print(response.body);

    var convertJson = response.body.map((data) {
      var profileModel = ProfileModel.fromMap(data);
      return profileModel;
    });

    profiles = List<ProfileModel>.from(convertJson);

    await Future.delayed(Duration(seconds: 3));

    loading.value = false;
  }
}
