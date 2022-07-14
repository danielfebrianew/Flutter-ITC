import 'package:flutter/material.dart';
import 'package:login_application/colors/primaryblack.dart';
import 'package:login_application/pages/firstassignmentpage.dart';
import 'package:login_application/pages/landingpage.dart';
import 'package:login_application/widgets/drawer_widget.dart';
import 'package:login_application/widgets/search_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  List<Widget> pages = const [
    LandingPage(),
    FirstAssignmentPage(),
  ];

  // List<PreferredSizeWidget> searchButton = [
  //   _appBarWithOutSearchButton(),
  //   _appBarWithSearchButton()
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      drawer: const NavigationDrawerWidget(),
      appBar: _appBar(),
      body: Container(
        alignment: Alignment.center,
        color: primaryBlack,
        child: pages[_currentIndex],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: const Color.fromRGBO(255, 163, 26, 1),
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Color.fromRGBO(255, 163, 26, 1),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: NavigationBar(
        height: 90,
        backgroundColor: Colors.black,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: Color.fromRGBO(255, 163, 26, 1),
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.auto_stories_rounded,
              color: Colors.black,
            ),
            icon: Icon(
              Icons.auto_stories_outlined,
              color: Color.fromRGBO(255, 163, 26, 1),
            ),
            label: 'First Assignment',
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        'Homepage',
        style: TextStyle(
          color: Color.fromRGBO(255, 163, 26, 1),
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: SearchUser());
          },
        ),
      ],
    );
  }
}
