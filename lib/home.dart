import 'package:bitirme/plants.dart';
import 'package:bitirme/profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBottomIndex = 0;
  PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: selectedBottomIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            selectedBottomIndex = value;
          });
        },
        children: [
          PlantsScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedBottomIndex,
        onTap: (value) {
          setState(() {
            selectedBottomIndex = value;
            pageController.animateToPage(selectedBottomIndex,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: '',
          )
        ],
      ),
    );
  }
}
