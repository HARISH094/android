import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../Utils/utils.dart';
import 'Loginscreen/loginscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  bool isLoading = true;

  void initState(){
    super.initState();
    loaderWidget();
    Timer(Duration(seconds:4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    Loginscreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              alignment: AlignmentDirectional.center,
              child: Lottie.asset(
                "asset/animation.json",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                animate: true,
              )),
        )
    );
  }
}
