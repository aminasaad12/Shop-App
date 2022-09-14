// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce/business_logic/bloc/cubit.dart';
import 'package:ecommerce/business_logic/bloc/states.dart';
import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/data/models/categories_model.dart';
import 'package:ecommerce/presentation/widghts/categories_widght.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context,index)=>BuildCategoriesShop(ShopCubit.get(context).categoriesModel!.data!.data[index]!),
            separatorBuilder:(context,index)=> Divider(),
            itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length

          );
        }
    );
  }



}
