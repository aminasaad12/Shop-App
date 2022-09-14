


import 'package:dio/dio.dart';
import 'package:ecommerce/constants/strings.dart';

class ShopWebService{

  static Dio? dio;
  static init(){
    dio =Dio(
        BaseOptions(
            baseUrl: baseUrl,
            receiveDataWhenStatusError: true ,
            connectTimeout: 20*1000,
            receiveTimeout:20*1000,
        )
    );
  }


  static Future<Response> getdata({
    required String url,
    Map<String,dynamic>? query,
    String? token,
    String lang = 'en',
}) async
{
    dio!.options.headers = {
     'lang': lang,
     'Authorization': token??'',
     'Content-Type':'application/json',

   };
  return await dio!.get(
      url,
      queryParameters: query,
  );
}

static Future<Response> postdata({
  required String url,
  Map<String,dynamic>? query,
  required Map<String,dynamic> data,
  String? token,
  String lang = 'en',

}) async{

  dio!.options.headers = {
    'Content-Type':'application/json',
    'lang':lang,
    'Authorization': token??'',

  };

     return dio!.post(
       url,
       queryParameters: query,
       data: data,
     );
}





}