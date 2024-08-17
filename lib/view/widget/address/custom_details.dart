import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/address/addres_details.dart';
import '../auth/customtextformauth.dart';

class CustomDetails extends StatelessWidget {
  const CustomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomForTextAuth(
          title: 'Address Name',
          description: 'Enter your Email',
          prefixIcon: Icons.location_on,
          controller: context.read<AddressDetailsCubit>().addressName,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomForTextAuth(
          title: 'City',
          description: 'Enter your City Name',
          prefixIcon: Icons.location_city,
          controller: context.read<AddressDetailsCubit>().city,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomForTextAuth(
          title: 'Address street',
          description: 'Enter your street',
          prefixIcon: Icons.email_outlined,
          controller: context.read<AddressDetailsCubit>().street,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 200,
              width: 150,
              child: CustomForTextAuth(
                title: 'House Number',
                description: 'Enter your House Number',
                prefixIcon: Icons.email_outlined,
                controller: context.read<AddressDetailsCubit>().houseNumber,
              ),
            ),
            SizedBox(
              height: 200,
              width: 150,
              child: CustomForTextAuth(
                title: 'Floor Number',
                description: 'Enter your Floor Number',
                prefixIcon: Icons.email_outlined,
                controller: context.read<AddressDetailsCubit>().floorNumber,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
