
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce/business_logic/bloc/cubit.dart';
import 'package:ecommerce/business_logic/bloc/states.dart';
import 'package:ecommerce/constants/strings.dart';
import 'package:ecommerce/data/respository/cache_helper.dart';
import 'package:ecommerce/presentation/screens/login/login_screen/log_in_screen.dart';
import 'package:ecommerce/presentation/widghts/widght.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
   SettingsScreen({Key? key}) : super(key: key);
   TextEditingController namecontroller = TextEditingController();
   TextEditingController emailcontroller = TextEditingController();
   TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void SignOut(context){
      CacheHelper.removeData(key: 'token').then((value) {
        if(value){
          NavigatorAndFinish(context, Login());
        }
      });
    }
    return  BlocConsumer<ShopCubit,ShopState>(
        listener: (context,state){
          // if(state is ShopSuccessuserdataState){
          //   namecontroller.text = state.shopLoginModel.data!.name!;
          //   emailcontroller.text = state.shopLoginModel.data!.email!;
          //   phonecontroller.text = state.shopLoginModel.data!.phone!;
          //
          // }
        },
        builder: (context,state){
          ShopCubit cubit =ShopCubit.get(context);
          var model = cubit.shopLoginModel;
          namecontroller.text = model!.data!.name!;
          emailcontroller.text = model.data!.email!;
          phonecontroller.text = model.data!.phone!;
          return ConditionalBuilder(
            condition: ShopCubit.get(context).shopLoginModel !=null,
            builder: (BuildContext context) =>Column(
              children: [
                FieldWidget(
                  iconData: Icons.person,
                  hintText: 'update your name',
                  labelText: 'name',
                  type: TextInputType.name,
                  validate: (value) {
                    // if (value == null ||
                    //     value.isEmpty) {
                    //   return 'name must not  be empty';
                    // }
                    // return null;
                  },
                  controller: namecontroller,
                ),
                FieldWidget(
                  iconData: Icons.email,
                  hintText: 'update your email',
                  labelText: 'Email',
                  type: TextInputType.emailAddress,
                  validate: (value) {
                    // if (value == null ||
                    //     value.isEmpty) {
                    //   return 'email must not  be empty';
                    // }
                    // return null;
                  },
                  controller: emailcontroller,
                ),
                FieldWidget(
                  iconData: Icons.person,
                  hintText: 'update your phone',
                  labelText: 'phone',
                  type: TextInputType.number,
                  validate: (value) {
                    // if (value == null ||
                    //     value.isEmpty) {
                    //   return 'phone must not  be empty';
                    // }
                    // return null;
                  },
                  controller: phonecontroller,
                ),
                ButtonWidget(
                  text: 'Sign Out',
                  fun:(){
                    SignOut(context);
                  },
                  backgroung: yellow,
                  colortext: white,
                ),
              ],
            ),
            fallback: (BuildContext context) =>Center(child: CircularProgressIndicator(
              color: yellow,
            )),

          );
    }
    );




  }


}