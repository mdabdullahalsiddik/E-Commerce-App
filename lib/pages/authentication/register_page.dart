import 'package:ecommace/pages/authentication/login_page.dart';
import 'package:ecommace/statics/all_colors.dart';
import 'package:ecommace/widgets/costom_appbar.dart';
import 'package:ecommace/widgets/costom_button.dart';
import 'package:ecommace/widgets/costom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: costomAppbar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                children: [
                  Text(
                    "Create Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AllColors.primarycolor,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Create an account so you can explore all the existing jobs",
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
                  CostomTextField(
                    hintText: "Confirm Password",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CostomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    color: AllColors.primarycolor,
                    child: const Text(
                      "Sign up",
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
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    child: const Text(
                      "Already have an account",
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
