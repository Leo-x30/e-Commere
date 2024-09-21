import 'package:e_commerce/Api/model/Register/Register_States.dart';
import 'package:e_commerce/Api/model/Register/Register_cupit.dart';
import 'package:e_commerce/Data/DialogUtils.dart';
import 'package:e_commerce/Data/appColor.dart';
import 'package:e_commerce/UI/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  static const String routName = "SignUp_Screen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  RegisterCupit cupit = RegisterCupit();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCupit, RegisterStates>(
        bloc: cupit,
        listener: (context, state) {
          if (state is RegisterLoadingStates) {
            Dialogutils.ShowLoudingDialog(context: context);
          } else if (state is RegisterErrorStates) {
            Dialogutils.HideLoudingDialog(context);
            Dialogutils.ShowMessageDialog(
                context: context,
                content: state.errorMessage,
                nigActionName: "ok",
                );
          } else if (state is RegisterSuccessStates) {
            Dialogutils.HideLoudingDialog(context);
            Dialogutils.ShowMessageDialog(
                context: context,
                content: "Register Success",
                posActionName: "ok",
                );
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.primarycolor,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: cupit.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Image.asset("assets/Group 5.png"),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Full Name',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "please Enter UserName";
                              }
                              return null;
                            },
                            onChanged: (text) {
                              cupit.nameController =
                                  TextEditingController(text: text);
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your fullname',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Mobile Number',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (text) {
                              if (text!.length < 9) {
                                return "please Valid Password ar least 9 num";
                              }
                              return null;
                            },
                            onChanged: (text) {
                              cupit.phoneController =
                                  TextEditingController(text: text);
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your Mobile Number',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'E-mail address',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (text) {
                              final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(cupit.emailController.text);
                              if (!emailValid) {
                                return "Please Enter a valid Email";
                              }
                              return null;
                            },
                            onChanged: (text) {
                              cupit.emailController =
                                  TextEditingController(text: text);
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your E-mail address',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Password',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (text) {
                              if (text!.length < 6) {
                                return "please Valid Password ar least 6 char";
                              }
                              return null;
                            },
                            onChanged: (text) {
                              cupit.passwordController =
                                  TextEditingController(text: text);
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  cupit.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  if (cupit.obscureText) {
                                    cupit.obscureText = false;
                                  } else {
                                    cupit.obscureText = true;
                                  }
                                  setState(() {});
                                },
                              ),
                              hintText: 'Enter your password',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Confirm Password',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (text) {
                              if (text == cupit.passwordController) {
                                return "Password has not match ";
                              }
                              return null;
                            },
                            onChanged: (text) {
                              cupit.repasswordController =
                                  TextEditingController(text: text);
                            },
                            obscureText: cupit.obscureText,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  cupit.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  if (cupit.obscureText) {
                                    cupit.obscureText = false;
                                  } else {
                                    cupit.obscureText = true;
                                  }
                                  setState(() {});
                                },
                              ),
                              hintText: 'Enter your password',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (cupit.formKey.currentState!.validate()) {
                            cupit.register();
                          }
                          // Navigate to home screen
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'SignIn',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                              color: AppColor.primarycolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You have already an account?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, LoginScreen.routName);
                            },
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
