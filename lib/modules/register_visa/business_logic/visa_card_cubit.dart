import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/models/to_json_models/to_json_final_token.dart';
import 'package:payment/shared/constants/strings.dart';
import 'package:payment/shared/network/dio_helper.dart';
import 'package:payment/shared/network/end_points.dart';
part 'visa_card_state.dart';

class VisaCardCubit extends Cubit<VisaCardState> {
  VisaCardCubit() : super(VisaCardInitial());
  static VisaCardCubit get(BuildContext context)=>BlocProvider.of<VisaCardCubit>(context);

  Future<void> getFinalToken(ToJsonFinalToken model) async {
    emit(GetFinalTokenLoad());
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
        print(error.response!.data);
        emit(GetFinalTokenError(error.response!.data['message']));
      } else {
        emit(GetFinalTokenError('some thing went wrong, please try again'));
      }
    }
  }

}
