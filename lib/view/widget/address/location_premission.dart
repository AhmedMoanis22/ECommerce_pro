import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../screen/address/add.dart';

class LocationPremission extends StatelessWidget {
  const LocationPremission({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        PermissionStatus locationstatus = await Permission.location.request();
        if (locationstatus == PermissionStatus.granted) {}
        if (locationstatus == PermissionStatus.denied) {
          const SnackBar(
            content: Text('This premission is recommended'),
          );
        }
        if (locationstatus == PermissionStatus.permanentlyDenied) {
          openAppSettings();
        }
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const AddressAdd()));
      },
      child: const Icon(Icons.add),
    );
  }
}
