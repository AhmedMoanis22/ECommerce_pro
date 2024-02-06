import 'package:ecommerce_pro/controller/address/address_state.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressDetailsCubit extends Cubit<AddressState> {
  AddressDetailsCubit() : super(IntialAddressState());
  static AddressDetailsCubit get(context) => BlocProvider.of(context);

  String? lat;
  String? lang;
  void setLatLng() {
    lat = sharedPreferences!.getDouble('lat').toString();
    print(lat);
    lang = sharedPreferences!.getDouble("lang").toString();
        
  }
}
