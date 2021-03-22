import 'package:flutter/foundation.dart';

class User {
  final String name, email;

  User({
    @required this.name,
    @required this.email,
  });

  String get firstName {
    String name = this.name.split(' ').first;
    name = name.substring(0, 1).toUpperCase() + name.substring(1);
    return name;
  }
}
