import 'package:e_commerce_route/core/reusable_components/Custom_bottom.dart';
import 'package:e_commerce_route/core/utils/assets_manager.dart';
import 'package:e_commerce_route/core/utils/constants.dart';
import 'package:e_commerce_route/core/utils/routes_manager.dart';
import 'package:e_commerce_route/core/utils/string_manager.dart';
import 'package:e_commerce_route/presentation/signup_user/SignUp_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/reusable_components/Custom_Form_Field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {
late TextEditingController EmailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> Formkey = GlobalKey<FormState>();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EmailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    EmailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.all(16.0),
            child: Form(
               key: Formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        AssetsManager.Route,
                        height: 71.h,width:237.w ,
                        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                    ),
                    SizedBox(height: 60.h,),
                    Text(StringManager.welcomeMessage,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600,fontSize: 24.sp ,color: Colors.white)
                      ,),
                    SizedBox(height: 8.h,),
                    Text(StringManager.pleaseSignIn,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w300,fontSize: 16.sp ,color: Colors.white)),
                    SizedBox(height: 20.h,),
                    CustomFormField(
                      controller: EmailController,
                        title: StringManager.emailTitle,
                        hintText:  StringManager.emailHint,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 20,
                         validator: (value) {
                           if (!Constants.EmailRegex.hasMatch(value??'')) {
                             return StringManager.notValidEmail;
                           }
                           },),
                    SizedBox(height: 15.h,),
                    CustomFormField(
                       controller: passwordController,
                        title:  StringManager.passwordTitle,
                        hintText:  StringManager.passwordHint,
                        keyboardType: TextInputType.visiblePassword,
                        maxLength: 20,
                        isObscure: true,
                        validator: (value) {
                         if ((value?.length??0)<8){
                           return StringManager.notValidPassword;
                         }
                        },),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(StringManager.forgotPass ,style: Theme.of(context).textTheme.bodyLarge,)
                      ],
                    ),
                    SizedBox(height: 28.h,),
                    SizedBox(
                      width: double.infinity,
                      child: CustomBottom(
                          title: StringManager.login,
                          onPressed: (){
                            if(Formkey.currentState?.validate()??false){}
                          }),
                    ),
                    SizedBox(height: 16.h,),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesManager.SignUpScreen);
                        },
                        child: Text(StringManager.dontHaveAcc,style: Theme.of(context).textTheme.bodyLarge,)
                    )
                  ],
                ),
            ),
          ),
        ),

    );
  }
}
