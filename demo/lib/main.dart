import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'Api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Api(),
      ),
    );
  }
}
