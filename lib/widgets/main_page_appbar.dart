import 'package:flutter/material.dart';

import '../general_utility.dart';
import '../main.dart';
import '../manager/navigator_manager.dart';

class deneme extends StatelessWidget with _MainPageUtility,GeneralUtility{
  deneme({Key? key}) : super(key: key);
  final NavigatorManager navigatorManager = NavigatorManager();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: normalPaddingAll,
          child: Text(text3,style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: white,fontSize: normalFontSize),),
        ),
        IconButton(onPressed: (){
          navigatorManager.navigatorPushManager(route: const MyApp(), context: context);
        }, icon: const Icon(Icons.add)),
        Container(decoration: BoxDecoration(
          borderRadius: customBorderRadius,
        ),),

        Text(textDeneme,style: Theme.of(context).textTheme.headlineMedium?.copyWith(overflow: TextOverflow.ellipsis),)
      ],
    );
  }
}

mixin _MainPageUtility{
  final String textDeneme = "deneme örnek 1";
  final Color white = Colors.white;
  final String text3 = "asfsadsad";
  final double customIconSize = 43;
  final EdgeInsets normalPaddingAll = const EdgeInsets.all(8.0);
  final BorderRadius customBorderRadius = BorderRadius.circular(20);
}//constructersız class

///

