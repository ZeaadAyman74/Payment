part of 'payment_cubit.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class GetFirstTokenLoad extends PaymentState {}
class GetFirstTokenSuccess extends PaymentState {}
class GetFirstTokenError extends PaymentState {
  String error;
  GetFirstTokenError(this.error);
}

class GetOrderIdSuccess extends PaymentState {}
class GetOrderIDError extends PaymentState {
  String error;
  GetOrderIDError(this.error);
}

class GetFinalTokenSuccess extends PaymentState {}
class GetFinalTokenError extends PaymentState {
  String error;
  GetFinalTokenError(this.error);
}
