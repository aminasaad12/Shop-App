
import 'package:ecommerce/business_logic/bloc/states.dart';
import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/data/models/categories_model.dart';
import 'package:ecommerce/data/models/favorites_model.dart';
import 'package:ecommerce/data/models/home_model.dart';
import 'package:ecommerce/data/models/login_model.dart';
import 'package:ecommerce/data/respository/cache_helper.dart';
import 'package:ecommerce/data/web_services/shop_web_services.dart';
import 'package:ecommerce/presentation/screens/cateogries/cateogries_screen.dart';
import 'package:ecommerce/presentation/screens/favorites/favorites_screen.dart';
import 'package:ecommerce/presentation/screens/products/products_screen.dart';
import 'package:ecommerce/presentation/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopState>{

  ShopCubit() : super(ShopInitialState()) ;
  static  ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  Map<int,bool> favorites ={};

  List<Widget> bottomScreen =

      [
        ProductsScreen(),
        CategoriesScreen(),
        FavoritesScreen(),
        SettingsScreen(),

      ];
  void ChangeBottom(int index){
    currentIndex = index;
    emit(ShopChangeBottomNavigationState());
  }
   HomeModel? homeModel;
  void getDataHome(){
    emit(ShopLoadingState());
    ShopWebService.getdata(
        url: HOME,
        token: token,
    ).then((value) {
      emit(ShopSuccessState());
      homeModel = HomeModel.fromJson(value.data );
      homeModel!.data!.products!.forEach((element) {
         favorites.addAll(
           {
             element.id:element.inFavorites,
           }
         );
      });
      print(favorites.toString());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorState());
    });


  }

  CategoriesModel? categoriesModel;
  void getDataCategories(){
    emit(ShopLoadingState());
    ShopWebService.getdata(
      url: CATEGORIES,
      token: token,
    ).then((value) {
      emit(ShopSuccesscategoriesState());
      categoriesModel = CategoriesModel.fromJson(value.data );


    }).catchError((error){
      print(error.toString());
      emit(ShopErrorcategoriesState());
    });


  }
  
  ChangeFavoritesModel? changeFavoritesModel;
  void changefavorites(int productId){
    favorites[productId] = !favorites[productId]!;
   emit(ShopSuccesschangefavoritesState());
    ShopWebService.postdata(
        url: FAVORITES,
        data: {
          'product_id' : productId,
        },
      token: token,
    )
    .then((value) {
      emit(ShopSuccesschangefavoritesState());
      changeFavoritesModel=ChangeFavoritesModel.fromJson(value.data);
     // print(value.data);
      if(changeFavoritesModel!.status!){
        favorites[productId] = !favorites[productId]!;
      }
    }).catchError((error){
      favorites[productId] = !favorites[productId]!;
      print(error.toString());
      emit(ShopErrorchangefavoritessState());
    });


  }

  ShopLoginModel? shopLoginModel;
  void getUserData(){
    emit(ShopuserLogindataState());
    ShopWebService.getdata(
        url: PROFILE,
        token: token
    ).then((value) {
      shopLoginModel = ShopLoginModel.fromJson(value.data );
      emit(ShopSuccessuserdataState(shopLoginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopErroruerdataState());
    });


  }




}