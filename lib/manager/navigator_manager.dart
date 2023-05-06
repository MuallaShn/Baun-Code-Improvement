import 'package:flutter/material.dart';

class NavigatorManager{
  void navigatorPushManager({required Widget route,required BuildContext context}){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => route,));
  }

  void navigatorPopManager({required BuildContext context}){
    Navigator.of(context).pop();
  }
}