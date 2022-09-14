// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:ecommerce/constants/strings.dart';
import 'package:flutter/material.dart';

void NavigatorAndFinish(context,widght)=>
    Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(
        builder:(context)=>widght ),
        (route) => false);

void  NavigatorTo(context,widght)=> Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context)=>  widght,
    )
);



Widget FieldWidget({
  TextEditingController? controller,
  required TextInputType  type,
  String? hintText,
  required String labelText,
  required IconData iconData,
  required String? Function(String?)? validate,
  String? Function(String?)? onChanged ,
  String? Function(String?)? Submitted ,
  VoidCallback? onTap ,
  IconData? suffixIcon,
  VoidCallback? suffixIconfun,
  bool obscureText = false,


})=> Container(
  child:TextFormField(
    controller:controller,
    keyboardType:type,
    onTap:onTap ,
    onChanged: (String value){
      print(value);
    },
    onFieldSubmitted:Submitted,
    validator: validate,
    obscureText:obscureText,
    cursorColor: yellow,
    style: TextStyle(
        color: black),
    decoration: InputDecoration(
        hintText:hintText,
        labelText:labelText,
        labelStyle: new TextStyle(
          color: const Color(0xFF424242),
          fontWeight: FontWeight.bold,
          fontSize: 13.0,
        ),

        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),

        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(
              color: black,
              width: 3.0
          ),
        ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(23.0),
          borderSide:
          BorderSide(
              color: yellow,
              width: 5.0
          ),
        ),
        prefixIcon: Icon(
          iconData,
          color: Colors.grey,
        ),
        suffixIcon: IconButton(
          onPressed:suffixIconfun,
          icon: Icon(
            suffixIcon,
            color: Colors.grey,
          ),
        )
    ),
  ),
);

Widget accountLine({
  required VoidCallback? onPressed,
  required String textone,
  required String texttwo,
  required Color colortext,
})=> Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(textone,
        style: TextStyle(
          fontFamily: MyFont,
        ),),
      TextButton(
          onPressed:onPressed,
          child:Text(texttwo,
            style: TextStyle(
              color:colortext,
              fontFamily: MyFont,
            ),))

    ],
  ),
);


Widget ButtonWidget({
  double width=double.infinity,
  double height=44.0,
  required Color backgroung,
  required VoidCallback fun,
  required String text,
  required Color colortext,

})=>  Container(
  child: MaterialButton(
    minWidth: width,
    height:  height=50,
    color: backgroung,
    onPressed:fun,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19.0)),
    child: Text(text,
      style:  TextStyle(
        fontSize: 18.0,
        color: colortext,
        fontWeight: FontWeight.bold,
        fontFamily: MyFont,
      ),),


  ),
);
