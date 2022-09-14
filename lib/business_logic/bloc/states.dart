
import 'package:ecommerce/data/models/favorites_model.dart';
import 'package:ecommerce/data/models/login_model.dart';

abstract class ShopState {}
class  ShopInitialState extends ShopState {}
class  ShopChangeBottomNavigationState extends ShopState {}

class  ShopLoadingState extends ShopState {}
class  ShopSuccessState extends ShopState
{}
class  ShopErrorState extends ShopState
{}

class  ShopSuccesscategoriesState extends ShopState
{}
class  ShopErrorcategoriesState extends ShopState
{}

class  ShopSuccesschangefavoritesState extends ShopState
{

}
class  ShopErrorchangefavoritessState extends ShopState
{}

class  ShopuserLogindataState extends ShopState {}
class  ShopSuccessuserdataState extends ShopState
{
  final ShopLoginModel shopLoginModel;

  ShopSuccessuserdataState(this.shopLoginModel);

}
class  ShopErroruerdataState extends ShopState
{}