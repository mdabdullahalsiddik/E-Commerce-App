import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommace/pages/Buttom%20Navigator%20Bar%20Page/bottom_navigator_bar_page%20.dart';
import 'package:ecommace/pages/Home%20Page/home_page.dart';
import 'package:ecommace/pages/authentication/login_page.dart';
import 'package:ecommace/statics/all_colors.dart';
import 'package:ecommace/widgets/costom_appbar.dart';
import 'package:ecommace/widgets/costom_button.dart';
import 'package:ecommace/widgets/costom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool passwordValidator = false;
  bool confampasswordValidator = false;
  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      CostomTextField(
                        controller: nameController,
                        hintText: "Name",
                        validator: (valueKey) {
                          if (valueKey!.isEmpty) {
                            return ("Enter your name");
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      CostomTextField(
                        controller: phoneController,
                        hintText: "Phone",
                        validator: (valueKey) {
                          if (valueKey!.isEmpty) {
                            return ("Enter your phone");
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      CostomTextField(
                        controller: confirmpasswordController,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      CostomButton(
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            if (passwordController.text.length >= 6 &&
                                confirmpasswordController.text.length >= 6) {
                              if (passwordController.text ==
                                  confirmpasswordController.text) {
                                try {
                                  FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: mailController.text,
                                    password: passwordController.text,
                                  );
                                  final user = await FirebaseFirestore.instance
                                      .collection("users")
                                      .where("email",
                                          isEqualTo: mailController.text)
                                      .get();
                                  if (user.docs.isNotEmpty) {
                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(mailController.text)
                                        .update({
                                      "name": nameController.text,
                                      "phone": phoneController.text,
                                      'email': mailController.text,
                                      'password': passwordController.text,
                                    });
                                  } else {
                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(mailController.text)
                                        .set({
                                      "name": nameController.text,
                                      "phone": phoneController.text,
                                      'email': mailController.text,
                                      'password': passwordController.text,
                                    });
                                  }
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ButtomNavigatorBarPage(),
                                    ),
                                    (route) => false,
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        e.toString(),
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      " Password are not mach ",
                                    ),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Enter 6 digit and longer password",
                                  ),
                                ),
                              );
                            }
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
      ),
    );
  }
}
