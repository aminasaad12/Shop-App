

import 'package:ecommerce/data/models/login_model.dart';

abstract class ShopRegisterState {}
class  ShopRegisterInitialState extends ShopRegisterState {}
class  ShopRegisterLoadingState extends ShopRegisterState {}
class  ShopRegisterSuccessState extends ShopRegisterState
{
  final ShopLoginModel shopLoginModel;

  ShopRegisterSuccessState(this.shopLoginModel);
}
class  ShopRegisterErrorState extends ShopRegisterState
{
  final String error;

  ShopRegisterErrorState(this.error);

}
class  ShopRegisterChageIconState extends ShopRegisterState{}