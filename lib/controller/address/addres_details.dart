import 'package:ecommerce_pro/controller/address/address_state.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressDetailsCubit extends Cubit<AddressState> {
  AddressDetailsCubit() : super(IntialAddressState());
  static AddressDetailsCubit get(context) => BlocProvider.of(context);

  String? lat;
  String? lang;
  TextEditingController addressName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController houseNumber = TextEditingController();
  TextEditingController floorNumber = TextEditingController();

  void setLatLng() {
    lat = sharedPreferences!.getDouble('lat').toString();
    print(lat);
    lang = sharedPreferences!.getDouble("lang").toString();
  }
}
