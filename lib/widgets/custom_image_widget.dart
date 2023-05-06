import 'package:flutter/material.dart';

class CustomImageContainerWidget extends StatelessWidget {
  const CustomImageContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 30),
          height: 120,
          decoration: BoxDecoration(
              color: color.AppColor.homePageCard,
              borderRadius: BorderRadius.circular(20),
              /*image: DecorationImage(
              image: AssetImage("assets/images/card.jpg"),
              fit: BoxFit.fill,
            ),*/
              boxShadow: [BoxShadow(
                blurRadius: 40,
                offset: Offset(8,10),
                color: color.AppColor.gradientFirst.withOpacity(0.3),
              ),
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(-1,-5),
                  color: color.AppColor.gradientFirst.withOpacity(0.3),
                ),
              ]
          ),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(right: 200,bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(image: AssetImage("assets/images/unnamed.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 100,
          margin:const EdgeInsets.only(left: 150,top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("İyi Gidiyorsun",
                style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color.AppColor.homePageTitleSecond,
                ),),
              const SizedBox(height: 10),
              RichText(text: TextSpan(text:"Aynen Böyle Devam\n",
                  style: TextStyle(fontSize: 16,
                    color: color.AppColor.homePageCardText,
                  ),
                  children: const [
                    TextSpan(text: "Plana Bağlı Kal")
                  ]
              ),
              ),
            ],
          ),
        ),
      ],),
    );
  }
}