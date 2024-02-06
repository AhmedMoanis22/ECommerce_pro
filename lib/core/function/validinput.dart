import 'package:get/get.dart';

validinput(String val, int min, int max, String type) {
  if (type == 'Username') if (!GetUtils.isUsername(val)) {
    return 'username is not valid';
  }

  if (type == 'Phone') if (!GetUtils.isPhoneNumber(val)) {
    return 'Phone is not valid';
  }
  if (type == 'Email') if (!GetUtils.isEmail(val)) {
    return 'Email is not valid';
  }

  if (val.length > max) {
    return 'can\'t be more than $max ';
  }
  if (val.length < min) {
    return 'can\'t be less than $min ';
  }
  if (val.isEmpty) {
    return 'can\'t be invalid';
  }
}
