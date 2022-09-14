 import 'package:flutter/material.dart';

 final String baseUrl = 'https://student.valuxapps.com/api/';
 const LOGIN = 'login';
 const HOME = 'home';
 const CATEGORIES = 'categories';
 const FAVORITES = 'favorites';
 const PROFILE = 'profile';
 const REGISTER = 'register';
 const  onboardingscreen = '/';
 const  loginscreen = '/login' ;
 const Color white = Colors.white;
 const Color black = Colors.black;
 const Color yellow = Color(0xFFFFD54F);
 const MyFont= 'Blueberry';

  String token = '';


 void printFullText(String text)
 {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
 }
