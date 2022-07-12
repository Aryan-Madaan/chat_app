import 'package:chat_app/Constants/constant.dart';
import 'package:chat_app/chat_services/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Email extends StatefulWidget {
  const Email({Key? key}) : super(key: key);

  @override
  State<Email> createState() => EmailState();
}

class EmailState extends State<Email> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _controller = TextEditingController();
  User? user;
  String? email;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
    email = user!.email;
    _controller.text = email!;
    isVisible = user!.emailVerified;
    print(user!.metadata);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          "Please Verify Your Email",
          style: TextConstants().headerText,
        ),
        TextField(
          readOnly: true,
          controller: _controller,
        ),
        Visibility(
          visible: isVisible,
          replacement: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              child: Text(
                "Continue",
                style: TextConstants().buttonText,
              )),
          child: ElevatedButton(
            onPressed: () async {
              await user!.sendEmailVerification();
              if (user!.emailVerified) {
                setState(() => isVisible = !isVisible);
              }
            },
            child: Text(
              "Verify Email",
              style: TextConstants().buttonText,
            ),
          ),
        ),
      ]),
    ));
  }
}
