import 'package:get/get.dart';
import 'package:nextflow_flutter_getx_profiles_api/models/profile_model/profile_model.dart';

class ProfileController extends GetxController {
  var profileList = <ProfileModel>[];
  var loading = true.obs;

  loadDataFromWebAPI() async {
    loading(true);

    // delay 3 seconds
    await Future.delayed(Duration(seconds: 3));

    var connect = Get.find<GetConnect>();
    var response = await connect.get(
      'https://651d740c44e393af2d59d2b4.mockapi.io/api/profiles',
    );

    var profileJSONList = response.body;

    var convertedProfileList = List<ProfileModel>.from(
      profileJSONList.map(
        (profileJSON) {
          return ProfileModel.fromMap(profileJSON);
        },
      ),
    );

    profileList = convertedProfileList;

    loading(false);
  }
}
