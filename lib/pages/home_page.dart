import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextflow_flutter_getx_profiles_api/controllers/profile_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    controller.loadDataFromWebAPI();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles'),
      ),
      // the body contains filter text field and list of profiles
      body: Obx(
        () {
          if (controller.loading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: controller.profileList.length,
            itemBuilder: (context, index) {
              var profile = controller.profileList[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(profile.avatar ?? ''),
                ),
                title: Text(profile.name ?? ''),
                subtitle: Text(profile.phone ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
