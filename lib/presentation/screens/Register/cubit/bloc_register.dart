

import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/data/models/login_model.dart';
import 'package:ecommerce/data/web_services/shop_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state_register.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterState> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static  ShopRegisterCubit get(context) => BlocProvider.of(context);


  ShopLoginModel? shopLoginModel;
  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }){
    emit(ShopRegisterLoadingState());
    ShopWebService.postdata(
        url: REGISTER,
        data:
        {
          'name' : name,
          'email' : email,
          'password' :  password,
          'phone' :  phone,

        }).then((value) {
      shopLoginModel= ShopLoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(shopLoginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));

    });
  }

  IconData? suffix=Icons.remove_red_eye_outlined;
  bool isPassword =true;

  void ChageIcon(){
    isPassword =! isPassword;
    suffix = isPassword ? Icons.remove_red_eye_sharp : Icons.visibility_off ;
    emit(ShopRegisterChageIconState());
  }

}