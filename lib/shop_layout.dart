// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/business_logic/bloc/cubit.dart';
import 'package:ecommerce/business_logic/bloc/states.dart';
import 'package:ecommerce/presentation/screens/search/search_screen.dart';
import 'package:ecommerce/presentation/widghts/widght.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';

class  ShopHome extends StatelessWidget {
  const  ShopHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ShopCubit()..getDataHome()..getDataCategories()..getUserData(),
      child: BlocConsumer<ShopCubit,ShopState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit =ShopCubit.get(context);
          return  Scaffold(
          appBar: AppBar(
           title: Text('Salla'),
            actions: [
               IconButton(
                   onPressed: (){
                     NavigatorTo(context, SearchScreen());
                   },
                   icon: Icon(Icons.search,size: 30.0,))
            ],
      ),
            body: cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                cubit.ChangeBottom(index);
              },
               iconSize: 30.0,
               currentIndex: cubit.currentIndex,
               fixedColor: yellow,
               items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home,),
                    label: 'Home',
                //  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps),
                    label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings'),
              ],
            ),
      );
        },
      ),
    );
  }
}
