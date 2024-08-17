import 'package:ecommerce_pro/controller/address/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/address/add_address_controller.dart';

class GoogleMapService extends StatelessWidget {
  const GoogleMapService({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddressCubit>(
      create: (BuildContext context) => AddressCubit()..getcurrentpostition(),
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (BuildContext context, AddressState state) {
          if (state is LoadingAddressState) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            markers: AddressCubit.get(context).markers.toSet(),
            onTap: (latlang) async {
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  latlang.latitude, latlang.longitude);
              print(placemarks[0].locality);
              AddressCubit.get(context).addmarker(latlang);
            },
            mapType: MapType.normal,
            initialCameraPosition: AddressCubit.get(context).kGooglePlex!,
            onMapCreated: (GoogleMapController controller) {
              AddressCubit.get(context).controller.complete(controller);
            },
          );
        },
      ),
    );
  }
}
