// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/data/respository/cache_helper.dart';
import 'package:ecommerce/presentation/screens/Register/register_screen.dart';
import 'package:ecommerce/presentation/screens/login/cubit/bloc_login.dart';
import 'package:ecommerce/presentation/screens/login/cubit/state_login.dart';
import 'package:ecommerce/presentation/widghts/widght.dart';
import 'package:ecommerce/shop_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreenItem extends StatelessWidget {
  const LoginScreenItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    return  BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginState>(
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
                            child: Column(
                              children: [
                                Text(
                                  'Let\'s Get Started',
                                  style: TextStyle(
                                    fontSize: 27,
                                    color: yellow,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: MyFont,
                                  ),
                                ),
                                SizedBox(
                                  height: 7.0,
                                ),
                                Text(
                                  'Log now to browse our hot offers',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                    fontFamily: MyFont,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80.0,
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
                                                iconData: Icons.email_outlined,
                                                hintText: 'Enter your email',
                                                labelText: 'Email',
                                                type: TextInputType.name,
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
                                                  iconData: Icons.lock,
                                                  hintText: 'Enter your password',
                                                  labelText: 'password',
                                                  type: TextInputType.name,
                                                  obscureText:  ShopLoginCubit.get(context).isPassword,
                                                  Submitted: (val){
                                                    if(_formKey.currentState!.validate()){
                                                      ShopLoginCubit.get(context).userLogin(
                                                          email: emailcontroller.text,
                                                          password: passwordcontroller.text);
                                                    }
                                                  },
                                                  validate: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'password  must not  be empty';
                                                    }
                                                    return null;
                                                  },
                                                  controller: passwordcontroller,
                                                  suffixIcon: ShopLoginCubit.get(context).suffix ,
                                                  suffixIconfun: (){
                                                    ShopLoginCubit.get(context).ChageIcon();
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
                          Container(
                              alignment: Alignment.bottomRight,
                              child: MaterialButton(
                                onPressed: () async {

                                },
                                child: Text(
                                  'Forget password?',
                                  style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: MyFont,
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          ConditionalBuilder(
                            condition: state is! ShopLoginLoadingState ,
                            builder: ( context)=>ButtonWidget(
                              text: 'Sign In',
                              fun: () async {
                                if(_formKey.currentState!.validate()){
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text);
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
                                NavigatorTo(context, Register_Screen());
                              },
                              colortext: yellow,
                              textone: 'Don\'t have an account?',
                              texttwo: 'Sign Up'),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          );
        },
        listener: (context, state) {

          if(state is ShopLoginSuccessState)
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
