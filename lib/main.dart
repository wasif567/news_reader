import 'package:flutter/material.dart';
import 'package:reader/app/app.dart';
import 'package:reader/app/injector/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}
