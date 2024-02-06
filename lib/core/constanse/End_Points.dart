import 'package:ecommerce_pro/main.dart';

////////////////////////////////////////auth////////////////////////////////////
String signUpEndPoint = 'auth/signup';
String verifyCodeSignUpEnfPoint = 'auth/signup/verify';
String loginEndPoint = 'auth/signin';
String forgetpasswordurl = 'auth/forgetpassword';
String resetPasswordEndPoint = 'auth/forgetpassword/resetpassword';
String resendVerifyCodeEndPoint = 'auth/resendVerify';

////////////////////////////////////////Categories////////////////////////////////////

String getCategories = 'categories/allCat';
///////////////////////////// items///////////////////////////////////////

String getItems = 'items/allItems';
///////////////////////////// favourite///////////////////////////////////////
String postfav = 'favourite';
String getfav = 'favourite?userId=${sharedPreferences!.getInt('User_id')}';
String deletAllfav = 'favourite/${sharedPreferences!.getInt('User_id')}:userId';
String deletefav = 'favourite';

///////////////////////////// cart///////////////////////////////////////

String addcart = 'cart';
String getCart = 'cart?userId=${sharedPreferences!.getInt('User_id')}';
String deleteAllCart = 'cart/${sharedPreferences!.getInt('User_id')}:userId';
String deleteQuantity = 'cart/item/quantity';
String deleteItemCart = 'cart/itemcart/item';

///////////////////////////// Search///////////////////////////////////////
String? searchName;

String serachEndPoint =
    'search';
/////////////////////////////////coupon/////////////////////////////////////

String getouponEndPoint='cupon/${sharedPreferences!.getInt('User_id')}:userId';

//////////////////////////////////////////////////////
String? emailverify;
int? indexx;
int? indexDetails;
