import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.info,
    required this.a,
    required this.b,
  });

  final List info;
  final int a;
  final int b;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: (MediaQuery.of(context).size.width-90)/2,
          height: 170,
          margin: const EdgeInsets.only(left: 30,bottom: 15),
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(
                  info[a]["img"]),
            ),
            boxShadow: [BoxShadow(
              blurRadius: 3,
              offset: const Offset(5,5),
              color: color.AppColor.gradientSecond.withOpacity(0.1),
            ),
              BoxShadow(
                blurRadius: 3,
                offset: const Offset(-5,-5),
                color: color.AppColor.gradientSecond.withOpacity(0.1),
              ),
            ],
          ),
          child: Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(info[a]['title'],
                style: TextStyle(fontSize: 20,
                    color: color.AppColor.homePageDetails),),
            ),
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width-90)/2,
          height: 170,
          margin: const EdgeInsets.only(left: 30,bottom: 15),
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(
                  info[b]["img"]),
            ),
            boxShadow: [BoxShadow(
              blurRadius: 3,
              offset: Offset(5,5),
              color: color.AppColor.gradientSecond.withOpacity(0.1),
            ),
              BoxShadow(
                blurRadius: 3,
                offset: Offset(-5,-5),
                color: color.AppColor.gradientSecond.withOpacity(0.1),
              ),
            ],
          ),
          child: Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(info[b]['title'],
                style: TextStyle(fontSize: 20,
                    color: color.AppColor.homePageDetails),),
            ),
          ),
        ),
      ],
    );
  }
}