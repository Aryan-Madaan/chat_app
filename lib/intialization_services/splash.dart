import 'dart:async';

import 'package:chat_app/chat_services/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool userLoggedIn = false;

  @override
  void initState() {
    super.initState();
  }

  void check() async {
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser;
    if (user != null) {
      if (user.email != null) {
        userLoggedIn = true;
      }
    }
    if (userLoggedIn) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const Home();
      }));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const Home();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => check());
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
