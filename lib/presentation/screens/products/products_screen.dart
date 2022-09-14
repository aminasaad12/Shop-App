// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce/business_logic/bloc/cubit.dart';
import 'package:ecommerce/business_logic/bloc/states.dart';
import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/presentation/widghts/home_shop_widght.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
        listener: (context,state){

        },
    builder: (context,state){
          return ConditionalBuilder(
              condition: ShopCubit.get(context).homeModel != null && ShopCubit.get(context).categoriesModel != null,
              builder: (context) => BuildHomeShop(ShopCubit.get(context).homeModel!,ShopCubit.get(context).categoriesModel!,context),
              fallback: (context)=> Center(child: CircularProgressIndicator(
                color: yellow,
              )),
          );

    }
    );
  }
}

