import 'package:flutter/material.dart';

import './home_page_view.dart';
import './search_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? _myPage;
  var selectedPage;
  List<Widget> pages = [
    HomePageView(),
    SearchPageView(),
  ];

  void setIndex(index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 0);
    selectedPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: selectedPage,
          children: pages,
        ),
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: setIndex,
          backgroundColor: Color.fromARGB(255, 210, 210, 210),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search_outlined),
              label: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
