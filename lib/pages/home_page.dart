import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextflow_flutter_getx_profiles_api/controllers/profile_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //sarng ProfileController lae sai long pai nai GetX; ProfileController() ma jark profile_controller.dart
    var controller = Get.put(ProfileController());

    //ern sai method
    controller.loadDataFromWebAPI();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles'),
      ),
      // the body contains filter text field and list of profiles
      body: Obx(() {
        if (controller.loading.value == true) {
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 5,
          ));
        } else {
          var profiles = controller.profiles;
          return ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage(profiles[index].avatar ?? ''),),
                title: Text(profiles[index].name ?? "untitle", style: TextStyle(color: Colors.purple),),
                subtitle: Text(profiles[index].phone ?? "0000-0000"),
                onTap: () {
                  print(profiles[index].name);
                  print(profiles[index].phone);
                },
              );
            },
          );
        }
      }),
    );
  }
}
