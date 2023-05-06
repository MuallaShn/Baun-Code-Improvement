import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/manager/navigator_manager.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

planets({required String planetImage, required String planetName}) {}

class _MainPageState extends State<MainPage> {
  final List<String> planetImage = [
    "assets/images/jüpiter.png",
    "assets/images/pluto.png",
    "assets/images/dünya.png",
    "assets/images/satürn.png",
  ];
  final List<String> planetName = [
    "Jupiter",
    "Pluto",
    "Earth",
    "Saturn",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.blackPearl,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titlePadding(context),
              _writingPadding(context),
              Padding(
                padding:
                const EdgeInsets.only(top: ProjectPadding.small2Padding),
                child: MainPageOptionsContainer(),
              ),
              //Boxes
              _planetBoxesListView(),
              // Elevated buttons
              const _ElevatedButtons(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _planetBoxesListView() {
    return SizedBox(
              width: ProjectWidht.infinityWidht,
              height: ProjectHeight.containerHeight,
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => SafeArea(
                  child: PlanetWidget(
                    planetImage: planetImage[index],
                    planetName: planetName[index],
                  ),
                ),
              ),
            );
  }

  _navigatorManagerPush(BuildContext context,{required Widget widget}) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => widget));
  }

  Padding _writingPadding(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: ProjectWidht.normalWidht, top: ProjectWidht.smallWidht),
      child: Text(
        ProjectTitles.MainPageSubtitle,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
          color: ProjectColors.white30,
        ),
      ),
    );
  }

  Padding _titlePadding(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: ProjectWidht.normalWidht, top: ProjectHeight.firstHeight),
      child: Text(
        ProjectTitles.MainPageTitle,
        style: Theme.of(context).textTheme.headline4?.copyWith(
          fontWeight: FontWeight.w500,
          color: ProjectColors.white,
        ),
      ),
    );
  }
}

//kutucukların designı
class PlanetWidget extends StatelessWidget {
  final String planetImage;
  final String planetName;

  const PlanetWidget({
    Key? key,
    required this.planetImage,
    required this.planetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ProjectPadding.small1Padding),
      child: Container(
        width: ProjectWidht.infinityWidht,
        decoration: BoxDecoration(
          color: ProjectColors.deepPurple,
          borderRadius: BorderRadius.circular(ProjectRadius.normalRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(ProjectPadding.bigPadding),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: ProjectHeight.boxContainerHeight,
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage(planetImage),
                  ),
                ),
                SizedBox(
                  height: ProjectHeight.smallHeight,
                ),
                Text(planetName,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _ElevatedButtons extends StatelessWidget {
  const _ElevatedButtons({Key? key}) : super(key: key);
  final NavigatorManager manager = NavigatorManager();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
              onPressed: () {
                manager.navigatorPushManager(route: const MyApp(), context: context);
              },
              icon: const Icon(Icons.border_all_outlined),
              label: Text(ProjectTitles.MainPageTitle),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ProjectColors.blackPearl)),
          SizedBox(height: ProjectHeight.smallHeight),
          ElevatedButton.icon(
              onPressed: () {
                _navigatorManagerPush(context, widget: SearchPage());
              },
              icon: const Icon(Icons.search),
              label: Text(ProjectTitles.SecondButtonTitle),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ProjectColors.blackPearl)),
          SizedBox(height: ProjectHeight.smallHeight),
          ElevatedButton.icon(
              onPressed: () {
                _navigatorManagerPush(context, widget:ProfilePage());
              },
              icon: const Icon(Icons.person),
              label: Text(ProjectTitles.ThirdButtonTitle),
              style: ElevatedButton.styleFrom(
                backgroundColor: ProjectColors.blackPearl,
              )),
        ],
      ),
    );
  }
}





///itemCaunt = PlanetImage.length