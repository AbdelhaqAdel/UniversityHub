
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:universityhup/core/utils/app_router.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/constants/hive_constants.dart';
import '../../../../core/functions/custom_snack_bar.dart';
import '../../../../core/functions/hive_function.dart';
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
  String? skip;

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
                        const _Image(),
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Expanded(
                              child: RadioListTile(
                                selectedTileColor: Colors.blue,
                                tileColor: Colors.blue,
                                hoverColor: Colors.blue,
                                activeColor: Colors.blue,
                                title: const Text(
                                  'Student',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                contentPadding: const EdgeInsets.all(0),


                                value:  'AbdulMajeedSallam@gmail.com',
                                groupValue: skip,
                                onChanged: (value) {
                                  setState(() {
                                    skip=value;

                                  });


                                },
                              ),
                            ),


                            Expanded(
                              child: RadioListTile(
                                selectedTileColor: Colors.blue,
                                tileColor: Colors.blue,
                                hoverColor: Colors.blue,
                                activeColor: Colors.blue,
                                title: const Text(
                                  'Doctor',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                contentPadding: const EdgeInsets.all(0),



                                value: 'Sara@gmail.com',
                                groupValue: skip,
                                onChanged: (value) {
                                  setState(() {

                                    skip=value;

                                  });



                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        state is LoginLoadingState
                            ? const SizedBox(height:70,child: Center(child: CircularProgressIndicator()))
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
    if (loginFormKey.currentState!.validate()) {
    LoginDataModel loginDataModel = LoginDataModel(
      email: emailController.text,
      password: passwordController.text,
      // email: skip,
      // password: 'P@ssw0rd',
    );
    cubit.login(
      loginDataModel: loginDataModel,
    );
    }
  }

  void _loginSuccess(LoginSuccessState state, context) async {
    loginEntity =LoginSuccessState.loginEntity;
    token=LoginSuccessState.loginEntity?.token;
    role=LoginSuccessState.loginEntity?.userRole;
    GoRouter.of(context).go(AppRouter.kLayout);
    HiveService.save('isLogin', true, HiveConstants.kStartBox);
    HiveService.save('token', token, HiveConstants.kStartBox);
    isLogin=true;
  }
}

class _Image extends StatelessWidget {
  const _Image({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

