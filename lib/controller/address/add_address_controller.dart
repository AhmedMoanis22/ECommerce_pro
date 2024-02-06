import 'dart:async';
import 'package:ecommerce_pro/controller/address/address_state.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(IntialAddressState());
  static AddressCubit get(context) => BlocProvider.of(context);
  Position? position;
  List<Marker> markers = [
    const Marker(
        markerId: MarkerId('1'), position: LatLng(31.048773, 31.404808))
  ];
  StreamSubscription<Position>? streamSubscription;

  double? lat;
  double? lang;
  GoogleMapController? gmc;
  addmarker(LatLng latlang) {
    markers.clear();
    markers.add(Marker(
        markerId: MarkerId('$latlang'),
        position: LatLng(latlang.latitude, latlang.longitude)));
    lat = latlang.latitude;
    print('latttt : $lat');
    sharedPreferences!.setDouble('lat', latlang.latitude);
    lang = latlang.longitude;
    print('langgg : $lang');
    sharedPreferences!.setDouble('lang', latlang.latitude);

    emit(AddedMarkersToMap(markerPostion: latlang));
  }

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  CameraPosition? kGooglePlex;

  getcurrentpostition() async {
    emit(LoadingAddressState());
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = const CameraPosition(
      target: LatLng(31.048773, 31.404808),
      zoom: 15,
    );

    emit(SuccessAddressState());
  }

  void getPostionStream() {
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      markers.add(Marker(
          markerId: MarkerId('1'),
          position: LatLng(position.latitude, position.longitude)));
    });
    emit(SuccessStreamAddressState());
  }
}
