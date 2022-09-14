// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/data/respository/cache_helper.dart';
import 'package:ecommerce/presentation/screens/login/login_screen/log_in_screen.dart';
import 'package:ecommerce/presentation/screens/onboarding/boarding_widght/on_boarding_widght.dart';
import 'package:ecommerce/presentation/widghts/widght.dart';
import 'package:flutter/material.dart';
class OnBoarding extends StatefulWidget {


  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  void Submit(){
    CacheHelper.saveData(key: 'OnBoarding', value: true).then((value) {
      if(value){
        NavigatorAndFinish(context, Login());
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0.0,
          actions: [
            TextButton(
              onPressed:Submit,
              child: Text('SKIP',
                style: TextStyle(
                  color:yellow,
                  fontFamily: MyFont,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
            )
          ],
        ),
        body:Column(
          children: [
            Expanded(
                child: PageView.builder(
                  controller: boardingController,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int index){
                    if(index == boarding.length-1)
                    {
                      setState(() {
                        isLast=true;
                      });
                    }
                    else{
                      setState(() {
                        isLast=false;
                      });
                    }
                  },
                  itemBuilder: (context,index)=>BuildBoardingItem( model: boarding[index],
                    onPressedfun: () {
                        if(isLast){
                          Submit();
                        }
                        else
                        {
                          boardingController.nextPage(
                              duration: Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.easeInOutCirc
                          );
                        }

                    },


                  ),
                  itemCount: boarding.length,
                )
            ),
          ],
        )
    );
  }
}



