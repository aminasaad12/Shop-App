// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/data/respository/cache_helper.dart';
import 'package:ecommerce/presentation/screens/Register/cubit/bloc_register.dart';
import 'package:ecommerce/presentation/screens/Register/cubit/state_register.dart';
import 'package:ecommerce/presentation/screens/login/login_screen/log_in_screen.dart';
import 'package:ecommerce/presentation/widghts/widght.dart';
import 'package:ecommerce/shop_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register_Screen extends StatelessWidget {
  const Register_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    var namecontroller = TextEditingController();
    var phonedcontroller = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterState>(
        builder: (context, state) {
          return Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25.0,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign Up 🔑️',
                              style: TextStyle(
                                fontSize: 27,
                                color: yellow,
                                fontWeight: FontWeight.bold,
                                fontFamily: MyFont,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [

                                              FieldWidget(
                                                  iconData: Icons.person,
                                                  hintText: 'Enter your name',
                                                  labelText: 'name',
                                                  type: TextInputType.name,
                                                  Submitted: (val){

                                                  },
                                                  validate: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'name  must not  be empty';
                                                    }
                                                    return null;
                                                  },
                                                  controller: namecontroller,

                                              ),
                                              SizedBox(
                                                height: 18.0,
                                              ),
                                              FieldWidget(
                                                iconData: Icons.email_outlined,
                                                hintText: 'Enter your email',
                                                labelText: 'Email',
                                                type: TextInputType.emailAddress,
                                                validate: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'email must not  be empty';
                                                  }
                                                  return null;
                                                },
                                                controller: emailcontroller,
                                              ),
                                              SizedBox(
                                                height: 18.0,
                                              ),
                                              FieldWidget(
                                                  iconData: Icons.phone,
                                                  hintText: 'Enter your phone',
                                                  labelText: 'phone',
                                                  type: TextInputType.phone,
                                                  validate: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'phone  must not  be empty';
                                                    }
                                                    return null;
                                                  },
                                                  controller: phonedcontroller,
                                                  suffixIconfun: (){

                                                  }


                                              ),
                                              SizedBox(
                                                height: 18.0,
                                              ),
                                              FieldWidget(
                                                  iconData: Icons.lock,
                                                  hintText: 'Enter your password',
                                                  labelText: 'password',
                                                  type: TextInputType.name,
                                                  obscureText:  ShopRegisterCubit.get(context).isPassword,
                                                  validate: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'password  must not  be empty';
                                                    }
                                                    return null;
                                                  },
                                                  controller: passwordcontroller,
                                                  suffixIcon: ShopRegisterCubit.get(context).suffix ,
                                                  suffixIconfun: (){
                                                    ShopRegisterCubit.get(context).ChageIcon();
                                                  }


                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 39.0,
                          ),
                          ConditionalBuilder(
                            condition: state is! ShopRegisterLoadingState ,
                            builder: ( context)=>ButtonWidget(
                              text: 'Register',
                              fun: () async {
                                if(_formKey.currentState!.validate()) {
                                  ShopRegisterCubit.get(context).userRegister(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,
                                    name: namecontroller.text,
                                    phone: phonedcontroller.text,
                                  );
                                }
                              },
                              backgroung: yellow,
                              colortext: white,
                            ),
                            fallback:( context)=> Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 19.0,
                          ),
                          accountLine(
                              onPressed: () {
                                NavigatorTo(context, Login());
                              },
                              colortext: yellow,
                              textone: 'Already have an account?',
                              texttwo: 'Sign In'),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          );
        },
        listener: (context, state) {
          if(state is ShopRegisterSuccessState)
          {
            if(state.shopLoginModel.status!){
              print(state.shopLoginModel.message);
              print(state.shopLoginModel.data!.token);
              CacheHelper.saveData(
                  key: 'token',
                  value: state.shopLoginModel.data!.token).then((value){
                token = state.shopLoginModel.data!.token!;
                NavigatorAndFinish(context, ShopHome());
              });
              Fluttertoast.showToast(
                  msg: state.shopLoginModel.message!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: white,
                  fontSize: 16.0
              );
            }else{
              print(state.shopLoginModel.message);
              Fluttertoast.showToast(
                  msg: state.shopLoginModel.message!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: white,
                  fontSize: 16.0
              );
            }
          }
        },

      ),
    );
  }
}
