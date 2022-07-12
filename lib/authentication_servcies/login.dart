import 'package:chat_app/authentication_servcies/email.dart';
import 'package:chat_app/chat_services/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  Future<void> signIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
          // clientId:
          //     "493546123215-nqknn5fei3aq00dk7m3kdhgdnbfc789k.apps.googleusercontent.com"
          );
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        await auth.signInWithCredential(authCredential);
      } else {
        displayIssue(null);
      }
    } catch (e) {
      displayIssue(e.toString());
      print(e);
    }
  }

  void displayIssue(String? s) {
    s = s ?? 'Something Went wrong';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
  }

  void _navigateToHome() {
    var user = auth.currentUser;
    if (user!.emailVerified) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Email()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: ElevatedButton.icon(
            label: const Text("Sign in with Google"),
            icon: const Icon(Icons.login_sharp),
            onPressed: () async {
              await signIn();
              var user = auth.currentUser;
              if (user != null) {
                _navigateToHome();
              } else {
                displayIssue("Please Try Again");
              }
            },
          ),
        ),
      ),
    );
    // if(){

    // }
  }
}
