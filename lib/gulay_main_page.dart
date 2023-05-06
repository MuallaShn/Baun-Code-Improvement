import 'package:flutter/material.dart';
import 'package:untitled1/consts/colors.dart';
import 'package:untitled1/widgets/custom_image_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with _HomePageUtility{
  final GeneralColors colors = GeneralColors();
  List info=[];

  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
      info=json.decode(value);
    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: customBodyPaddingOnly,
        child: Column(
          children: [
            _myAppBar(context),
            const SizedBox(height: 25,),
            _menu(context),
            const SizedBox(height: 20),
            buildContainer(context),
            const SizedBox(height: 5,),
            const CustomImageContainerWidget(),
            _textCompanent(),
            _cardListView(context),

          ],
        ),
      ),
    );
  }

  Expanded _cardListView(BuildContext context) {
    return Expanded(child: OverflowBox(
            maxWidth: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: info.length.toDouble()~/2,
                itemBuilder: (_,i){
                  int a=2*i;
                  int b=2*i+1;
                  return CustomCardWidget(info: info, a: a, b: b);
                }),
          ),
          );
  }

  Row _textCompanent() {
    return Row(
            children: [
              Text("Ders Alanları",
                //textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: color.AppColor.homePageTitle,
                ),
              ),
            ],
          );
  }

  Container buildContainer(BuildContext context) {
    return Container(
            width: double.infinity,
            height: containerHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                color.AppColor.gradientFirst.withOpacity(0.8),
                color.AppColor.gradientSecond.withOpacity(0.9),
              ],
                begin: Alignment.bottomLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: customContainerBorderRadius,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5,10),
                  blurRadius: 10,
                  color: color.AppColor.gradientSecond.withOpacity(0.2),
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 20,top: 25,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(afterLesson,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: colors.green),
                  ),
                  const SizedBox(height: 5),
                  Text(fizikLesson,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colors.green),
                  ),
                  const SizedBox(height: 5),
                  Text(yapilicak,
                    style: TextStyle(
                      fontSize: 25,
                      color:color.AppColor.homePageContainerTextSmall,
                    ),),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.timer,size: 20,color: color.AppColor.homePageContainerTextSmall),
                          Padding(

                            padding: const EdgeInsets.all(8.0),
                            child: Text(sixteenMin,
                              style: TextStyle(
                                fontSize: 20,
                                color:color.AppColor.homePageContainerTextSmall,
                              ),),
                          ),
                        ],),
                      Expanded(child: Container()),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: customBorderRadiusCircular,
                          boxShadow: [BoxShadow(color: color.AppColor.gradientFirst,blurRadius: 10,offset: Offset(4,8))],
                        ),
                        child: Icon(Icons.play_circle_fill,size: 60,
                          color: color.AppColor.homePagePlayerIcon,
                        ),
                      ),
                    ],)
                ],
              ),
            ),
          );
  }

  Row _menu(BuildContext context) {
    return Row(children: [
            Text(seninProgram,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black,)
            ),
            Expanded(child: Container()),
            Text(detay,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black,)
            ),
            const SizedBox(width: 5),
            Icon(Icons.arrow_forward,size: 20,color: color.AppColor.homePageIcon,),
          ],);
  }

  Row _myAppBar(BuildContext context) {
    return Row(children: [
            Text(dersler,style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black,)
            ),
            Expanded(child: Container()),
            Icon(Icons.arrow_back_ios,size: 20,color: color.AppColor.homePageIcon,),
            const SizedBox(width: 10,),
            Icon(Icons.calendar_today_outlined,size: 20,color: color.AppColor.homePageIcon,),
            const SizedBox(width: 10,),
            Icon(Icons.arrow_forward_ios,size: 20,color: color.AppColor.homePageIcon,),
          ],);
  }
}





mixin _HomePageUtility{
  final EdgeInsets customBodyPaddingOnly = const EdgeInsets.only(top: 70,left: 30,right: 30);
  final String dersler = "Dersler";
  final String seninProgram = "Senin Programın";
  final String detay = "Detay";
  final double containerHeight = 220;
  final BorderRadius customContainerBorderRadius = const BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(80),
      bottomRight: Radius.circular(10),
      bottomLeft: Radius.circular(10));
  final String afterLesson = "Sonraki Çalışma";
  final String fizikLesson = "Fizik Dersi";
  final String yapilicak = "Yapılacak Son Tekrarlar";
  final String sixteenMin = "60 min";
  final BorderRadius customBorderRadiusCircular = BorderRadius.circular(60);
}

///////////// main.dart için
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = 'Flutter Demo';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}