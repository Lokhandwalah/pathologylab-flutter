import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    navigateForward(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(child: FlutterLogo()),
          ),
          Positioned(
            bottom: 20,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }

  void navigateForward(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => Container(),),);
  }
}
