import 'package:flutter/material.dart';
import 'package:pathologylab/models/user.dart';
import 'package:pathologylab/screens/auth_screen.dart';
import 'package:pathologylab/services/authentication.dart';
import 'package:pathologylab/utils/dialogs.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${widget.user.firstName}'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text("Logout"),
        onPressed: () async {
          showLoader(context);
          await AuthService().signOut();
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => AuthScreen(),
            ),
          );
        },
      )),
    );
  }
}
