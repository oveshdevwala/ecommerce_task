import 'package:ecommerce_task/app.dart';
import 'package:ecommerce_task/core/object_box/object_box.dart';
import 'package:ecommerce_task/injectable.dart';
import 'package:flutter/material.dart';

late ObjectBox object;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  object = await ObjectBox.create();
  createInjectable();
  runApp(const App());
}

