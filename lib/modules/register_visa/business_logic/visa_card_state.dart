part of 'visa_card_cubit.dart';

abstract class VisaCardState {}

class VisaCardInitial extends VisaCardState {}

class GetFinalTokenLoad extends VisaCardState {}
class GetFinalTokenSuccess extends VisaCardState {}
class GetFinalTokenError extends VisaCardState {
  String error;
  GetFinalTokenError(this.error);
}

class InitializeController extends VisaCardState {}