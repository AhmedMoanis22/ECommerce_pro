import 'package:flutter/material.dart';
import '../../widget/address/location_premission.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const LocationPremission(),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Address',
          textAlign: TextAlign.start,
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
