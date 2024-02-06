
abstract class AddressState{}
class IntialAddressState extends AddressState{}
class LoadingAddressState extends AddressState{}

class SuccessAddressState extends AddressState{}
class ErrorAddressState extends AddressState{}
class AddedMarkersToMap extends AddressState{
  final dynamic markerPostion;

  AddedMarkersToMap({required this.markerPostion});
}
class SuccessStreamAddressState extends AddressState{}





