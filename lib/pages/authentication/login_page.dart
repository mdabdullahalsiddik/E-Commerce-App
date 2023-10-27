import 'package:ecommace/pages/Buttom%20Navigator%20Bar%20Page/bottom_navigator_bar_page%20.dart';
import 'package:ecommace/pages/authentication/register_page.dart';
import 'package:ecommace/statics/all_colors.dart';
import 'package:ecommace/widgets/costom_appbar.dart';
import 'package:ecommace/widgets/costom_button.dart';
import 'package:ecommace/widgets/costom_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordValidator = false;
  var formkey = GlobalKey<FormState>();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: costomAppbar(
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                children: [
                  Text(
                    "Login here",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AllColors.primarycolor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Welcome back you’ve \nbeen missed!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AllColors.primarycolor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    CostomTextField(
                      controller: mailController,
                      hintText: "Email",
                      validator: (valueKey) {
                        if (valueKey!.isEmpty) {
                          return ("Enter your mail");
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CostomTextField(
                      controller: passwordController,
                      hintText: "Password",
                      validator: (valueKey) {
                        if (valueKey!.isEmpty) {
                          return ("Enter your password");
                        }
                        return null;
                      },
                      obscureText: !passwordValidator,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              passwordValidator = !passwordValidator;
                            },
                          );
                        },
                        icon: Icon(
                          passwordValidator
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AllColors.primarycolor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot your password?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AllColors.primarycolor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,),
                          ),
                        )
                      ],
                    ),
                    CostomButton(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ButtomNavigatorBarPage(),
                            ),
                          );
                        }
                      },
                      color: AllColors.primarycolor,
                      child: const Text(
                        "Sign in",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Create new account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
