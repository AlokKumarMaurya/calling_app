import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testing_work121/testing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WorkTest(),

  )
  );
}