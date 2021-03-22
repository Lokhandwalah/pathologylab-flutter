import 'package:flutter/material.dart';

void showLoader(BuildContext context, {bool canPop = false}) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () => Future.value(canPop),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
