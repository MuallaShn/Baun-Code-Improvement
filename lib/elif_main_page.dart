import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/manager/navigator_manager.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<CardItem> carditems = [
    const CardItem(cardImage: "assets/images/scream.jpg"),
    const CardItem(cardImage: "assets/images/interstellar.jpg"),
    const CardItem(cardImage: "assets/images/harrypotter.jpg"),
  ];
  List<WatchItem> watchitems = [
    const WatchItem(
      watchImage: "assets/images/godzilla.jpg",
      watchName: "Godzilla vs Kong",
      watchSub: "Action Movie",
    ),
    const WatchItem(
      watchImage: "assets/images/demonslayermovie.jpg",
      watchName: "DS: Mugen Train",
      watchSub: "Anime Movie",
    ),
    const WatchItem(
      watchImage: "assets/images/conjuring.jpg",
      watchName: "The Conjuring",
      watchSub: "Thriller Movie",
    ),
  ];
  List<GenreItem> genreitems = [
    const GenreItem(genre: "ACTION"),
    const GenreItem(genre: "ANIMATION"),
    const GenreItem(genre: "ANIME"),
    const GenreItem(genre: "THRILLER"),
  ];
  List<MovieItem> movieitems = [
    const MovieItem(movieImage: "assets/images/it.jpg"),
    const MovieItem(movieImage: "assets/images/avatar.jpg"),
    const MovieItem(movieImage: "assets/images/titanic.jpg"),
    const MovieItem(movieImage: "assets/images/patchadams.jpg"),
  ];
  final NavigatorManager navigatorManager = NavigatorManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _mainPageAppBar(context),
      body: Column(
        children: [
          const SizedBox(
            height: BoxSizes.box1,
          ),
          _cardItemsListView(),
          const SizedBox(
            height: BoxSizes.box5,
          ),
          _menuTextAndIcon(),
          const SizedBox(height: BoxSizes.box1),
          _watchItemsListView(),
          const SizedBox(
            height: BoxSizes.box7,
          ),
          _titlemenu(),
          const SizedBox(
            height: BoxSizes.box1,
          ),
          _genreItemsListView(),
          const SizedBox(
            height: BoxSizes.box1,
          ),
          _titleMenuTwo(),
          _movieItemsListView(),
        ],
      ),
      bottomNavigationBar: _BottomNavigationContainer(navigatorManager: navigatorManager),
    );
  }

  SizedBox _movieItemsListView() {
    return SizedBox(
            height: BoxSizes.box9,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (context, _) => const SizedBox(
                width: BoxSizes.box4,
              ),
              itemBuilder: (context, index) =>
                  MovieWidget(item: movieitems[index]),
            ));
  }

  Row _titleMenuTwo() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              ProjectTitles.title8,
              style: TextStyle(
                  color: ProjectColors.whiteColor,
                  fontSize: ProjectFontSizes.font1),
            ),
          ],
        );
  }

  SizedBox _genreItemsListView() {
    return SizedBox(
            height: BoxSizes.box8,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (context, _) => const SizedBox(
                width: BoxSizes.box4,
              ),
              itemBuilder: (context, index) =>
                  GenreWidget(item: genreitems[index]),
            ));
  }

  Row _titlemenu() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              ProjectTitles.title7,
              style: TextStyle(
                  color: ProjectColors.whiteColor,
                  fontSize: ProjectFontSizes.font1),
            ),
          ],
        );
  }

  SizedBox _watchItemsListView() {
    return SizedBox(
            height: BoxSizes.box6,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (context, _) => const SizedBox(
                width: BoxSizes.box4,
              ),
              itemBuilder: (context, index) =>
                  WatchWidget(item: watchitems[index]),
            ));
  }

  Row _menuTextAndIcon() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ProjectTitles.title6,
              style: TextStyle(
                  color: ProjectColors.whiteColor,
                  fontSize: ProjectFontSizes.font1),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: ProjectColors.whiteColor,
            ),
          ],
        );
  }

  SizedBox _cardItemsListView() {
    return SizedBox(
            height: BoxSizes.box3,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (context, _) => const SizedBox(
                width: BoxSizes.box4,
              ),
              itemBuilder: (context, index) =>
                  BuildWidget(item: carditems[index]),
            ));
  }

  AppBar _mainPageAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColors.transparentColor,
      leading: const Icon(
        Icons.play_circle_outline_rounded,
        color: ProjectColors.whiteColor,
        size: ProjectIconSizes.normalIconSize,
      ),
      centerTitle: true,
      actions: [
        TextButton(
          child: const Text(ProjectTitles.title1,
              style: TextStyle(
                  fontSize: ProjectFontSizes.normalfontSize,
                  color: ProjectColors.redColor) ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
        ),
        const SizedBox(
          width: BoxSizes.box1,
        ),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ShowPage()));
            },
            child: const Text(
              ProjectTitles.title2,
              style: TextStyle(
                  fontSize: ProjectFontSizes.normalfontSize,
                  color: ProjectColors.lightgreyColor),
            )),
        const SizedBox(width: BoxSizes.box2),
        const Icon(
          Icons.search,
          color: ProjectColors.whiteColor,
          size: ProjectIconSizes.normalIconSize,
        )
      ],
    );
  }
}

class _BottomNavigationContainer extends StatelessWidget {
  const _BottomNavigationContainer({
    required this.navigatorManager,
  });

  final NavigatorManager navigatorManager;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
      child: BottomAppBar(
        color: ProjectColors.transparentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  navigatorManager.navigatorPushManager(route: const MyApp(), context: context);
                },
                icon: const Icon(
                  Icons.home,
                  color: ProjectColors.redColor,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: ProjectColors.whiteColor,
                )),
            IconButton(
                onPressed: () {
                  navigatorManager.navigatorPushManager(route: const MyApp(), context: context)
                },
                icon: const Icon(
                  Icons.play_arrow,
                  color: ProjectColors.whiteColor,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: ProjectColors.whiteColor,
                )),
          ],
        ),
      ),
    );
  }
}
