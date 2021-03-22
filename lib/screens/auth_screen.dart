import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pathologylab/screens/home_screen.dart';
import 'package:pathologylab/services/authentication.dart';
import 'package:pathologylab/utils/dialogs.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign-in'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Sign-in with Google',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              onPressed: () async {
                showLoader(context);
                await AuthService().googleSignIn().then((user) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => HomePage(user: user),
                    ),
                  );
                }).catchError((error) {
                  Fluttertoast.showToast(msg: error.toString());
                  Navigator.of(context).pop();
                });
              },
            )
          ],
        )));
  }
}
