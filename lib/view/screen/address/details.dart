import 'package:ecommerce_pro/controller/address/addres_details.dart';
import 'package:ecommerce_pro/controller/address/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddressDetailsCubit>(
      create: (BuildContext context) => AddressDetailsCubit()..setLatLng(),
      child: BlocBuilder<AddressDetailsCubit, AddressState>(
        builder: (BuildContext context, AddressState state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: const Text('Address Details'),
            ),
          );
        },
      ),
    );
  }
}
