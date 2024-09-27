
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/utils/app_router.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/custom_snack_bar.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/widgets/back_icon.dart';
import '../../../../core/widgets/background.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../data/models/login_model.dart';
import '../manager/login_cubit/login_cubit.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          _loginSuccess(state, context);
        }
        if (state is LoginErrorState) {
          showSnackBar(message: 'Login Failed', context: context);
        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return BackGround(
          widget: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: loginFormKey,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*.97,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        const BackIcon(),
                        Container(
                          alignment: AlignmentDirectional.center,
                          child: CircleAvatar(
                            radius: 130,
                            backgroundColor: Colors.black.withOpacity(.0),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'assets/images/login.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text('Welcome !',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 35)),
                        const SizedBox(
                          height: 15,
                        ),
                        Text('You can login here',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 20)
                          // TextStyle(
                          //   fontSize:25,
                          //   color: Colors.black87,
                          // ),
                        ),
                        const Spacer(),
                        CustomTextFormField(
                          borderRadius: 20,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Email',
                          prefixIcon: FontAwesomeIcons.solidEnvelope,
                          obscureText: false,
                          suffix: const SizedBox(),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextFormField(
                          borderRadius: 20,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'Password',
                          prefixIcon: FontAwesomeIcons.lock,
                          obscureText: cubit.isVisible,
                          suffix: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 20),
                            child: GestureDetector(
                              onTap: () {
                                cubit.changeEye();
                              },
                              child: FaIcon(
                                cubit.isVisible
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.eye,
                                color: KColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        state is LoginLoadingState
                            ? const CircularProgressIndicator()
                            : CustomButton(
                          onTap: () {
                            _clickOnLogin(cubit);
                          },
                          text: 'Login',
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _clickOnLogin(LoginCubit cubit) {
    // if (loginFormKey.currentState!.validate()) {
    LoginDataModel loginDataModel = LoginDataModel(
      // email: emailController.text,
      // password: passwordController.text,
      email: 'AbdulMajeedSallam@gmail.com',
      password: 'P@ssw0rd',
    );
    cubit.login(
      loginDataModel: loginDataModel,
    );
    // }
  }

  void _loginSuccess(LoginSuccessState state, context) async {
    showSnackBar(message: 'Login Successful', context: context);
    GoRouter.of(context).push(AppRouter.kLayout);
    token=LoginSuccessState.loginEntity?.token;

    // save('isLogin', true, kStartBox);
    // save('uId', LoginSuccessState.loginEntity?.uid, kStartBox);
    // save('isSkip', false, kStartBox);
    // save('id', LoginSuccessState.loginEntity?.id, kStartBox);
  }
}

