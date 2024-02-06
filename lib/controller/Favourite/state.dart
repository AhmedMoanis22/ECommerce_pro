import 'package:ecommerce_pro/core/class/network_exceptions.dart';

abstract class AddAndDeleteState {}

class IntialAddAndDeleteState extends AddAndDeleteState {}

class LoadingAddAndDelete extends AddAndDeleteState {}

class SuccessAdd extends AddAndDeleteState {
  final String msg;

  SuccessAdd({required this.msg});
}

class ErrorAdd extends AddAndDeleteState {
  final NetworkExceptions msg;

  ErrorAdd({required this.msg});
}

class SuccessDelete extends AddAndDeleteState {
  final String msg;

  SuccessDelete({required this.msg});
}

class ErrorDelete extends AddAndDeleteState {
  final NetworkExceptions error;

  ErrorDelete({required this.error});
}

class SuccessDeleteAll extends AddAndDeleteState {
  final String msg;

  SuccessDeleteAll({required this.msg});
}

class ErrorDeleteAll extends AddAndDeleteState {
  final NetworkExceptions error;

  ErrorDeleteAll({required this.error});
}

class SuccessDeleteQuantity extends AddAndDeleteState {
  final String msg;

  SuccessDeleteQuantity({required this.msg});
}

class ErrorDeleteQuantity extends AddAndDeleteState {
  final NetworkExceptions error;

  ErrorDeleteQuantity({required this.error});
}

