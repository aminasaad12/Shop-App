
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables



import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/data/respository/cache_helper.dart';
import 'package:ecommerce/presentation/screens/login/login_screen/log_in_screen.dart';
import 'package:ecommerce/presentation/screens/onboarding/components/slanding_clipper.dart';
import 'package:ecommerce/presentation/widghts/widght.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel{
  late final String image;
  late final String body;

  BoardingModel({
    required this.image,
    required this.body,
  });
}
var  boardingController =PageController();
bool isLast=false;
List<BoardingModel> boarding=
[
  BoardingModel(
    image: 'assets/images/onboard1.png',
    body: ' Hello you will find what you want here 👋. ',
  ),
  BoardingModel(
    image: 'assets/images/onboard2.png',
    body: 'Enjoy the shopping and products you want 🛒🛍️.',
  ),
  BoardingModel(
    image: 'assets/images/onboard3.png',
    body: ' Don\'t miss the support❤!!',
  ),
];

Widget BuildBoardingItem({
  required BoardingModel model,
  required VoidCallback onPressedfun,

})=> Padding(
  padding: const EdgeInsets.only(
    right: 10.0,
    left: 10.0,
  ),
  child: Stack(
    children: [
      Column(
        children:
        [
          Image(
            image: AssetImage('${model.image}'
            ),
          ),
          Spacer(),
          ClipPath(
            clipper: SlandingClipper(),
            child: Container(
                color: yellow,
                child: Column(
                  children: [
                    SizedBox(
                      height: 90.0,
                    ),
                    Positioned(
                      child: Container(
                        width:double.infinity,
                        padding: EdgeInsets.all(20.0),
                        child: Text(model.body,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: white,
                            fontFamily: MyFont,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed:onPressedfun,
                      backgroundColor: white,
                      child: const Icon(Icons.navigate_next_outlined,
                        color: black,
                      ),

                    ),
                    SizedBox(
                      height:40.0 ,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 40.0
                      ),
                      child: SmoothPageIndicator(
                          controller: boardingController,
                          effect:   ExpandingDotsEffect(
                            dotColor: white,
                            activeDotColor: black,
                            expansionFactor: 4,
                            dotHeight: 11,
                            dotWidth: 10,
                            spacing: 5,
                          ),
                          count: boarding.length),
                    ),

                  ],
                )
            ),
          ),
        ],
      ),
    ],
  ),
);

