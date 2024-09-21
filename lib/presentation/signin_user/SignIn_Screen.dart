import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/DI/di.dart';
import '../../core/reusable_components/Custom_Form_Field.dart';
import '../../core/reusable_components/Custom_bottom.dart';
import '../../core/utils/assets_manager.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/routes_manager.dart';
import '../../core/utils/string_manager.dart';
import 'ViewModel/sign_in_veiw_model_cubit.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInViewModel>(),
      child: Scaffold(
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
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AssetsManager.Route,
                      height: 71.h,
                      width: 237.w,
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  SizedBox(
                    height: 86.h,
                  ),
                  Text(
                    StringManager.welcomeMessage,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    StringManager.pleaseSignIn,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w300, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomFormField(
                    controller: emailController,
                    validator: (value) {
                      if (!Constants.EmailRegex.hasMatch(value ?? "")) {
                        return StringManager.notValidEmail;
                      }
                    },
                    title: StringManager.emailTitle,
                    hintText: StringManager.emailHint,
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 40,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomFormField(
                    controller: passwordController,
                    validator: (value) {
                      if ((value?.length ?? 0) < 8) {
                        return StringManager.notValidPassword;
                      }
                    },
                    title: StringManager.passwordTitle,
                    hintText: StringManager.passwordHint,
                    keyboardType: TextInputType.visiblePassword,
                    isObscure: true,
                    maxLength: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      StringManager.forgotPass,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontWeight: FontWeight.w400, fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<SignInViewModel, SignInViewModelState>(
                      listener: (context, state) {
                        if (state is SignInViewModelSuccess) {
                          Fluttertoast.showToast(
                              msg: "Logged in successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.pushNamedAndRemoveUntil(context,
                              RoutesManager.HomeRouteName, (route) => false);
                        }
                        if (state is SignInViewModelError) {
                          Fluttertoast.showToast(
                              msg: state.error,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      builder: (context, state) {
                        if (state is SignInViewModelLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }

                        return CustomBottom(
                          title: StringManager.login,
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              
                              SignInViewModel.get(context).SingIn(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RoutesManager.SignUpScreen);
                      },
                      child: Text(
                        StringManager.dontHaveAcc,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
