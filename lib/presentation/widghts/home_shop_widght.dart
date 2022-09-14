// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/business_logic/bloc/cubit.dart';
import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/data/models/categories_model.dart';
import 'package:ecommerce/data/models/home_model.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

Widget BuildHomeShop(HomeModel model , CategoriesModel categoriesModel,context)=>SingleChildScrollView(
  physics: BouncingScrollPhysics(),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CarouselSlider(

        items: model.data!.banners!.map((e) =>Container(

          //  margin: EdgeInsets.all(8.0),

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image: DecorationImage(

              image: NetworkImage('${e.image}'),

              fit: BoxFit.cover,

            ),

          ),



        ),

        ).toList(),



        // carouselController: buttonCarouselController,

        options: CarouselOptions(

            enlargeCenterPage: true,

            viewportFraction: 0.9,

            aspectRatio: 2.0,

            initialPage: 0,

            reverse: false,

            autoPlay: true,

            autoPlayInterval: Duration(seconds:  3),

            autoPlayAnimationDuration: Duration(seconds:  1),

            autoPlayCurve: Curves.fastOutSlowIn,

            scrollDirection: Axis.horizontal



        ),

      ),
      SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 14.0
        ),
        child: Text(
          "categories",
          style: TextStyle(
            color: yellow,
            fontFamily: MyFont,
            fontSize: 22.0,

          ),),
      ),
      Container(
        height: 80.0,
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index)=>buildlistofcategories(categoriesModel.data!.data[index]),
            separatorBuilder: (context,index)=>SizedBox(width:0.0),
            itemCount: categoriesModel.data!.data.length,
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 14.0
        ),
        child: Text(
          "New Categories",
          style: TextStyle(
            color: yellow,
            fontFamily: MyFont,
            fontSize: 22.0,

          ),),
      ),
      Container(
          margin: EdgeInsets.all(12),

          // color: Color(0xFFdddddd),
          color: Colors.white,

          child:StaggeredGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            children: List.generate(
              model.data!.products!.length,
                  (index) => builStaggeredGridProducts(model.data!.products![index],context),

            ),
          )
      )

    ],

  ),
);

Widget builStaggeredGridProducts(Products model,context)=>
    Column(
      children: [
        Stack(
          children: [
            Image(image: NetworkImage(model.image)),
            if(model.disCount !=0)
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 5.0
                ),
                color: Colors.red,
                child: Text('DisCount',
                  style: TextStyle(
                      fontFamily: MyFont,
                      color: Colors.white,
                      fontSize: 14.0
                  ),
                ),
              ),

          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 5.0,
              bottom: 5.0
          ),
          child: Text(model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: MyFont,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 10.0
          ),
          child: Row(
            children: [
              Text('${model.price}',
                style: TextStyle(
                    fontFamily: MyFont,
                    fontSize: 20.0,
                    color: yellow
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              if(model.disCount !=0)
                Text('${model.oldPrice}',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2.55,
                      fontFamily: MyFont,
                      fontSize: 15.0,
                      color: Colors.grey
                  ),
                ),
              Spacer(),
              IconButton(
                  onPressed: (){
                    ShopCubit.get(context).changefavorites(model.id);
                    print("object");
                  },
                  icon: CircleAvatar(
                    backgroundColor: ShopCubit.get(context).favorites[model.id]! ?
                     Color(0xFFE34234) : Color(0xFFdddddd) ,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ))


            ],
          ),
        ),
        SizedBox(
          height: 12.0,
        )

      ],

    );

Widget buildlistofcategories(DataModel model)=>Padding(
  padding: const EdgeInsets.only(
    left: 14.0,
  ),
  child:   Container(

      width:250.0,

      height: 80.0,

      color: Color(0xFFeeeeee),

      child: Row(

        children: [

          Padding(

            padding: const EdgeInsets.only(

                left: 10.0

            ),

            child: Image(

              image: NetworkImage(model.image!),

              height: 70.0,

              width: 70.0,),

          ),

          SizedBox(

            width: 10.0,

          ),

          Text(model.name!,

            maxLines: 1,

            overflow: TextOverflow.ellipsis,

            style: TextStyle(

              color: black,

              fontFamily: MyFont,

              fontSize: 16.0,



            ),)

        ],

      )

  ),
);