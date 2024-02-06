import 'package:ecommerce_pro/view/screen/address/add.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
           PermissionStatus locationstatus =
                          await Permission.location.request();
                      if (locationstatus == PermissionStatus.granted) {}
                      if (locationstatus == PermissionStatus.denied) {
                        const SnackBar(
                          content: Text('This premission is recommended'),
                        );
                      }
                      if (locationstatus ==
                          PermissionStatus.permanentlyDenied) {
                        openAppSettings();
                      }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>  const AddressAdd()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Address',
          textAlign: TextAlign.start,
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
