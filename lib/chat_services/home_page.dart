import 'package:chat_app/Constants/constant.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: MyAppBar().appBar1,
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Text("Hello and Welcome"),
              ),
            ),
          )),
    );
  }
}
