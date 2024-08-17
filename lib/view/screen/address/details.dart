import 'package:ecommerce_pro/controller/address/addres_details.dart';
import 'package:ecommerce_pro/controller/address/address_state.dart';
import 'package:ecommerce_pro/view/screen/address/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/address/custom_details.dart';
import '../../widget/auth/CustomButtomAuth.dart';

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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomDetails(),
                    const SizedBox(
                      height: 250,
                    ),
                    CustomButtomAuth(
                      onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddressView()));
                      },
                        width: 200,
                        title: 'Continue',
                        buttoncolor: Colors.red[300]!,
                        textcolor: Colors.white)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
