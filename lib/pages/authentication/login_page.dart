import 'package:ecommace/pages/Buttom%20Navigator%20Bar/bottom_navigator_bar_page%20.dart';
import 'package:ecommace/pages/authentication/register_page.dart';
import 'package:ecommace/statics/all_colors.dart';
import 'package:ecommace/widgets/costom_appbar.dart';
import 'package:ecommace/widgets/costom_button.dart';
import 'package:ecommace/widgets/costom_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Welcome back you’ve \nbeen missed!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AllColors.primarycolor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                children: [
                  CostomTextField(
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CostomTextField(
                    hintText: "Password",
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
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  CostomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ButtomNavigatorBarPage(),
                          ));
                    },
                    color: AllColors.primarycolor,
                    child: const Text(
                      "Sign in",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
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
                          ));
                    },
                    child: const Text(
                      "Create new account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
