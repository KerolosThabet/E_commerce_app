import 'package:e_commerce_route/core/reusable_components/Custom_Form_Field.dart';
import 'package:e_commerce_route/core/reusable_components/Custom_bottom.dart';
import 'package:e_commerce_route/core/utils/string_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/assets_manager.dart';
import '../../core/utils/constants.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
   late TextEditingController FullNameController = TextEditingController();
   late TextEditingController MobileController = TextEditingController();
   late TextEditingController EmailController = TextEditingController();
   late TextEditingController passwordController = TextEditingController();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FullNameController =TextEditingController();
    MobileController = TextEditingController();
    EmailController = TextEditingController();
    passwordController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    FullNameController.dispose() ;
    MobileController.dispose();
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
            key: formKey,
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

                SizedBox(height: 46.h,),
                CustomFormField(
                    title: StringManager.fullNameTitle,
                    hintText: StringManager.fullNameHint,
                    keyboardType: TextInputType.name,
                    maxLength: 20,
                    controller: FullNameController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return StringManager.cantBeEmpty;
                      }
                    },),
                SizedBox(height: 8.h,),
                CustomFormField(
                    title: StringManager.phoneTitle,
                    hintText: StringManager.phoneHint,
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    controller: MobileController,
                    validator: (value) {
                      if ((value?.length??0)<11){
                        return StringManager.notValidPhone;
                      }
                    }),
                SizedBox(height: 8.h,),
                CustomFormField(
                    title: StringManager.emailTitle,
                    hintText: StringManager.emailHint,
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 20,
                    controller: EmailController,
                  validator: (value) {
                    if (!Constants.EmailRegex.hasMatch(value??'')) {
                      return StringManager.notValidEmail;
                    }
                  },),
                SizedBox(height: 8.h,),
                CustomFormField(
                  isObscure: true,
                    title: StringManager.passwordTitle,
                    hintText: StringManager.passwordHint,
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 20,
                    controller: passwordController,
                    validator: (value) {
                      if ((value?.length??0)<8){
                        return StringManager.notValidPassword;
                      }
                    },),
                SizedBox(height: 28.h,),
                SizedBox(
                  width: double.infinity,
                  child: CustomBottom(
                      title: StringManager.signup,
                      onPressed: () {
                        if(formKey.currentState?.validate()??false){}
                      },
                  ),
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
}


