import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/models/to_json_models/to_json_final_token.dart';
import 'package:payment/models/to_json_models/to_json_order_id.dart';
import 'package:payment/shared/constants/strings.dart';
import 'package:payment/shared/network/dio_helper.dart';
import 'package:payment/shared/network/end_points.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  static PaymentCubit get(BuildContext context) => BlocProvider.of<PaymentCubit>(context);

  Future<void> getFirstToken({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String amount,
  }) async {
    emit(GetFirstTokenLoad());
    try {
      final Response response = await DioHelper.postData(
          path: EndPoints.firstToken,
          data: {'api_key': AppStrings.payMobApiKey});
      if (response.statusCode == 201) {
        AppStrings.firstToken = response.data['token'];
        debugPrint(AppStrings.firstToken);
        await getOrderId(ToJsonOrderId(
            token: AppStrings.firstToken,
            amount: amount,
            currency: 'EGP',
            items: []));
        await getFinalToken(ToJsonFinalToken(
            token: AppStrings.firstToken,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            amount: amount,
            orderId: AppStrings.orderId,
            currency: 'EGP',
            integrationId: AppStrings.integrationIdCard));
       await getFinalKioskToken(ToJsonFinalToken(
            token: AppStrings.firstToken,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            amount: amount,
            orderId: AppStrings.orderId,
            currency: 'EGP',
            integrationId: AppStrings.integrationIdCard));
        emit(GetFirstTokenSuccess());
      }
    } catch (error) {
      if (error is DioError) {
        emit(GetFirstTokenError(error.response!.data['message']));
      } else {
        emit(GetFirstTokenError('some thing went wrong, please try again'));
      }
    }
  }

  Future<void> getOrderId(ToJsonOrderId model) async {
    try {
      final Response response = await DioHelper.postData(
        path: EndPoints.orderId,
        data: model.toJson(),
      );
      if (response.statusCode == 201) {
        AppStrings.orderId = response.data['id'].toString();
        debugPrint(AppStrings.orderId);
        emit(GetOrderIdSuccess());
      }
    } catch (error) {
      if (error is DioError) {
        emit(GetOrderIDError(error.response!.data['message']));
      } else {
        emit(GetOrderIDError('some thing went wrong, please try again'));
      }
    }
  }

  Future<void> getFinalToken(ToJsonFinalToken model) async {
    try {
      final Response response = await DioHelper.postData(
          path: EndPoints.finalToken, data: model.toJson());
      if (response.statusCode == 201) {
        AppStrings.finalToken = response.data['token'].toString();
        debugPrint(AppStrings.finalToken);
        emit(GetFinalTokenSuccess());
      }
    } catch (error) {
      if (error is DioError) {
        emit(GetFinalTokenError(error.response!.data['message']));
      } else {
        emit(GetFinalTokenError('some thing went wrong, please try again'));
      }
    }
  }

  Future<void> getFinalKioskToken(ToJsonFinalToken model) async {
    try {
      final Response response = await DioHelper.postData(
          path: EndPoints.finalToken, data: model.toJson());
      if (response.statusCode == 201) {
        AppStrings.finalKioskToken = response.data['token'].toString();
        debugPrint(AppStrings.finalKioskToken);
        emit(GetFinalTokenSuccess());
      }
    } catch (error) {
      if (error is DioError) {
        emit(GetFinalTokenError(error.response!.data['message']));
      } else {
        emit(GetFinalTokenError('some thing went wrong, please try again'));
      }
    }
  }


}
