import 'package:efficacy_user/utils/utils.dart';
import 'package:efficacy_user/widgets/custom_phone_input/custom_phone_input.dart';
import 'package:efficacy_user/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:efficacy_user/config/config.dart';
import 'package:efficacy_user/pages/pages.dart';
import 'package:intl_phone_field/phone_number.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/SignUpPage';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;
  PhoneNumber? phoneNumber;
  IconData passVisibility = Icons.visibility;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double gap = height * 0.01;
    return WillPopScope(
      onWillPop: () async {
        final quitCondition = await showExitWarning(context);
        return quitCondition ?? false;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: height * 0.3,
                    padding: EdgeInsets.symmetric(vertical: height * 0.06),
                    width: width,
                    decoration: const BoxDecoration(color: Color(0xFF213F8D)),
                    child: Container(
                        width: width*0.3,
                        child: Image.asset(
                      "assets/images/efficacy_logo.png",
                      fit: BoxFit.fitHeight,
                    ))),
                Container(
                  height: height * 0.7,
                  width: width,
                  color: const Color(0xFF213F8D),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.03, horizontal: width * 0.05),
                    height: height * 0.7,
                    width: width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xFF213F8D)),
                          ),
                        ),
                        Gap(gap),
                        CustomTextField(
                          controller: emailController,
                          label: "Email",
                          validator: Validator.isEmailValid,
                          borderRadius: 50,
                          height: height * 0.09,
                          prefixIcon: Icons.email,
                        ),
                        CustomTextField(
                          controller: passwordController,
                          hiddenText: hidePassword,
                          label: "Password",
                          validator: 
                              Validator.isPasswordValid,
                          borderRadius: 50,
                          height: height * 0.09,
                          prefixIcon: Icons.lock,
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (passVisibility == Icons.visibility) {
                                  setState(() {
                                    passVisibility = Icons.visibility_off;
                                    hidePassword = false;
                                  });
                                } else {
                                  setState(() {
                                    passVisibility = Icons.visibility;
                                    hidePassword = true;
                                  });
                                }
                              },
                              icon: Icon(
                                passVisibility,
                                color: const Color.fromARGB(255, 67, 67, 67),
                              )),
                        ),
                        CustomPhoneField(
                          label: "Phone No.",
                          onPhoneChanged: (PhoneNumber newPhoneNumber) {
                            phoneNumber = newPhoneNumber;
                          },
                          borderRadius: 50,
                          helperText: "* Optional",
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize:
                                          Size(size.width * 0.5, height * 0.05),
                                      backgroundColor: const Color(0xFF213F8D)),
                                  onPressed: () {
                                    _formKey.currentState!.validate();
                                  },
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(fontSize: 17),
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.popAndPushNamed(
                                          context, SignInPage.routeName);
                                    },
                                    child: const Text(
                                      "Sign in",
                                      style: TextStyle(fontSize: 12),
                                    ))
                              ],
                            ),
                            const Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                )),
                                Text(
                                  "  Or Sign Up with  ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Expanded(
                                    child: Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                ))
                              ],
                            ),
                            Gap(gap),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          minimumSize: Size(
                                              height * 0.07, height * 0.07),
                                          side: const BorderSide(
                                              width: 0, color: Colors.white),
                                          shape:
                                              const ContinuousRectangleBorder(),
                                          elevation: 3),
                                      onPressed: () {},
                                      child: Container(
                                          height: height * 0.07,
                                          width: height * 0.03,
                                          padding: EdgeInsets.symmetric(vertical: height*0.01),
                                          child: const Image(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/images/google_logo.png")))),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          minimumSize: Size(
                                              height * 0.07, height * 0.07),
                                          side: const BorderSide(
                                              width: 0, color: Colors.white),
                                          shape:
                                              const ContinuousRectangleBorder(),
                                          elevation: 3),
                                      onPressed: () {},
                                      child: Container(
                                          height: height * 0.07,
                                          width: height * 0.03,
                                          padding: EdgeInsets.symmetric(vertical: height*0.01),
                                          child: const Image(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/images/google_logo.png")))),
                                ].separate(gap*2))
                          ],
                        ),
                      ].separate(gap),
                    )),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
