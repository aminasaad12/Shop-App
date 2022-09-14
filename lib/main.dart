import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/data/models/login_model.dart';
import 'package:ecommerce/data/respository/cache_helper.dart';
import 'package:ecommerce/data/web_services/shop_web_services.dart';
import 'package:ecommerce/helper/bloc_observer.dart';
import 'package:ecommerce/presentation/screens/login/login_screen/log_in_screen.dart';
import 'package:ecommerce/presentation/screens/onboarding/boarding_screen/on_boarding_screen.dart';
import 'package:ecommerce/shop_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/themes.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ShopWebService.init();
  await CacheHelper.init()!;

  bool? onboarding =CacheHelper.getData(key: 'OnBoarding');
  Widget? widget;
  String? token =CacheHelper.getData(key: 'token');
  print(token);

  if(onboarding != null){
    if(token != null) widget = ShopHome();
    else widget = Login();
  }else{
    widget=OnBoarding();
  }
  runApp( MyApp(
      // appRouter:AppRouter(),
    StartWidget: widget,));
}

class MyApp extends StatelessWidget {
  // final AppRouter appRouter;
  final Widget? StartWidget;

  const MyApp({super.key,  required this.StartWidget});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeDatamode,
      debugShowCheckedModeBanner: false,
       home:StartWidget ,


    );
  }
}


