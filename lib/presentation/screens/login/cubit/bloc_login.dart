

import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/data/models/login_model.dart';
import 'package:ecommerce/data/web_services/shop_web_services.dart';
import 'package:ecommerce/presentation/screens/login/cubit/state_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginState>
{
  ShopLoginCubit() : super(ShopLoginInitialState()) ;

  static  ShopLoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? shopLoginModel;
  void userLogin({
    required String email,
    required String password,
}){
    emit(ShopLoginLoadingState());
    ShopWebService.postdata(
        url: LOGIN,
        data:
        {
          'email' : email,
          'password' :  password,

        }).then((value) {
          print(value.data);
          shopLoginModel= ShopLoginModel.fromJson(value.data);
          print(shopLoginModel!.status);
          print(shopLoginModel!.message);
          print(shopLoginModel!.data!.token);
          emit(ShopLoginSuccessState(shopLoginModel!));
        }).catchError((error){
          emit(ShopLoginErrorState(error));
    });
  }

  IconData suffix=Icons.remove_red_eye_outlined;
  bool isPassword =true;

  void ChageIcon(){
    isPassword =! isPassword;
    suffix = isPassword ? Icons.remove_red_eye_sharp : Icons.visibility_off;
    emit(ShopLoginChageIconState());
  }

}
