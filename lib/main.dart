
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvp_crypto/common/injector.dart';
import 'package:mvp_crypto/views/crypto_home_page.dart';


void main() async {
  Injector.configure(Environment.MOCK);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[100]
              : null),
      home: new HomePage(),
    );
  }
}