import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://accept.paymob.com/api/',
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
        receiveDataWhenStatusError: true,
      ),
    );
  }

static Future<dynamic> getData({
  required String path,
  required Map<String,dynamic>?parameters,
})async{
  dio.options.headers={
    'Content-Type':'application/json',
  };
  return await dio.get(path,queryParameters: parameters);
}

  static Future<dynamic> postData({
    required String path,
     Map<String,dynamic>?parameters,
    required dynamic data,
  })async{
    dio.options.headers={
      'Content-Type':'application/json',
      };
    return await dio.post(path,queryParameters: parameters,data: data);
  }

  // static Future<dynamic> putData({
  //   required String path,
  //   required Map<String,dynamic>?parameters,
  //   required dynamic data,
  //   required String token,
  // })async{
  //   dio.options.headers={
  //     'Content-Type':'application/json',
  //     'lang':'en',
  //     'Authorization':token,
  //   };
  //   return await dio.put(path,queryParameters: parameters,data: data);
  // }
}
