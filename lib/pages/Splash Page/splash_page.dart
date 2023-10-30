import 'package:ecommace/pages/Buttom%20Navigator%20Bar%20Page/bottom_navigator_bar_page%20.dart';
import 'package:ecommace/pages/Welcome%20Page/welcomepage.dart';
import 'package:ecommace/statics/all_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future welcome() async {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => FirebaseAuth.instance.currentUser == null
                  ? const WelcomePage()
                  : const ButtomNavigatorBarPage(),
            ),
            (route) => false));
  }

  @override
  void initState() {
    welcome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.primarycolor,
      body: Center(
        child: Image.asset(
          "assets/images/welcome_image.png",
        ),
      ),
    );
  }
}
