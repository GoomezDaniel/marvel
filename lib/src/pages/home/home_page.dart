import 'package:flutter/material.dart';

/// My Classes
import 'package:marvel/src/pages/seeAll/see_all_page.dart';
import 'package:marvel/src/size_config.dart';
import 'components/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomSelectedIndex = 2;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.person), label: 'Characters'),
      BottomNavigationBarItem(
        icon: new Icon(Icons.menu_book_sharp),
        label: 'Comics',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(
        icon: new Icon(Icons.event_seat),
        label: 'Events',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Series')
    ];
  }

  PageController pageController = PageController(
    initialPage: 2,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: <Widget>[
        SeeAllPage(
          title: 'Characters',
          index: 1,
        ),
        SeeAllPage(
          title: 'Comics',
          index: 2,
        ),
        Home(),
        SeeAllPage(
          title: 'Events',
          index: 3,
        ),
        SeeAllPage(
          title: 'Series',
          index: 4,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        selectedItemColor: Colors.red,
        unselectedItemColor: Theme.of(context).cardColor,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomChange(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }

  void bottomChange(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}
