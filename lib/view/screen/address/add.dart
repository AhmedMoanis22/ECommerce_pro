import 'package:ecommerce_pro/controller/address/add_address_controller.dart';
import 'package:ecommerce_pro/controller/address/address_state.dart';
import 'package:ecommerce_pro/view/widget/auth/CustomButtomAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'add new address',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        body: BlocProvider<AddressCubit>(
          create: (BuildContext context) =>
              AddressCubit()..getcurrentpostition(),
          child: BlocBuilder<AddressCubit, AddressState>(
            builder: (BuildContext context, state) {
              if (state is LoadingAddressState) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (AddressCubit.get(context).kGooglePlex != null)
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          GoogleMap(
                            
                            markers: AddressCubit.get(context).markers.toSet(),
                            onTap: (latlang)async {
                              List<Placemark> placemarks = await placemarkFromCoordinates(latlang.latitude, latlang.longitude);
                              print(placemarks[0].locality);
                              AddressCubit.get(context).addmarker(latlang);
                            },
                            mapType: MapType.normal,
                            initialCameraPosition:
                                AddressCubit.get(context).kGooglePlex!,
                            onMapCreated: (GoogleMapController controller) {
                              AddressCubit.get(context)
                                  .controller
                                  .complete(controller);
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            child: CustomButtomAuth(
                                width: 200,
                                title: 'Continue',
                                buttoncolor: Colors.red[300]!,
                                textcolor: Colors.white),
                          )
                        ],
                      ),
                    ),
                ],
              );
            },
          ),
        ));
  }
}
