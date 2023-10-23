import 'package:ecommace/pages/authentication/login_page.dart';
import 'package:ecommace/statics/all_colors.dart';
import 'package:ecommace/widgets/costom_appbar.dart';
import 'package:ecommace/widgets/costom_button.dart';
import 'package:ecommace/widgets/costom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formkey = GlobalKey<FormState>();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confamePasswordController = TextEditingController();
  bool passwordValidator = false;
  bool confampasswordValidator = false;
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
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Create an account so you can explore all the existing jobs",
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
                          return ("Enter your confirm mail");
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
                      obscureText: !passwordValidator,
                       validator: (valueKey) {
                        if (valueKey!.isEmpty) {
                          return ("Enter your password");
                        }
                        return null;
                      },
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
                    CostomTextField(
                      controller: confamePasswordController,
                      hintText: "Confirm Password",
                      validator: (valueKey) {
                        if (valueKey!.isEmpty) {
                          return ("Enter your confirm password");
                        }
                        return null;
                      },
                      obscureText: !confampasswordValidator,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              confampasswordValidator =
                                  !confampasswordValidator;
                            },
                          );
                        },
                        icon: Icon(
                          confampasswordValidator
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AllColors.primarycolor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CostomButton(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        }
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
                          ),
                        );
                      },
                      child: const Text(
                        "Already have an account",
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
