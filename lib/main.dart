import 'dart:io';

import 'package:authentication/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  // HttpClient client = HttpClient()
  //   ..badCertificateCallback =
  //       ((X509Certificate cert, String host, int port) => true);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenHome(),
    );
  }
}
