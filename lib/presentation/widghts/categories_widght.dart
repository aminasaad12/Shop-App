// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/data/models/categories_model.dart';
import 'package:flutter/material.dart';

Widget BuildCategoriesShop(DataModel model) =>
    Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Stack(
          children: [
            GestureDetector(
              onTap:() async{
              },
              child: Container(
                height: 160.0,
                width: double.infinity,
                child: model.image!.isNotEmpty
                    ?FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: 'assets/images/circle-loader.gif',
                  image: model.image!,
                  fit: BoxFit.cover,
                )
                    : Image.asset('assets/images/error.png'),
              ),
            ),
            Positioned(
                bottom: 20,
                right: 20,
                left: 20,
                child: Container(
                  color: Colors.black26,
                  width: 300,
                  padding: EdgeInsets.all(8),
                  child: Text(model.name!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color:black,
                        fontFamily: MyFont,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ),

          ],
        )

      ],
    );