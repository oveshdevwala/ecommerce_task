import 'package:flutter/material.dart';

customSnackBar(BuildContext context,{required String title}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
