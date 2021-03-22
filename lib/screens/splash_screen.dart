import 'package:flutter/material.dart';
import 'package:pathologylab/models/user.dart';
import 'package:pathologylab/screens/auth_screen.dart';
import 'package:pathologylab/screens/home_screen.dart';
import 'package:pathologylab/services/authentication.dart';

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
            child: Center(
                child: FlutterLogo(
              size: 100,
            )),
          ),
          Positioned(
            bottom: 100,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }

  void navigateForward(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) {
        if (AuthService().isUserLoggedIn) {
          User user = User(
              email: AuthService().currentUser.email,
              name: AuthService().currentUser.displayName);
          return HomePage(user: user);
        }
        return AuthScreen();
      }),
    );
  }
}
