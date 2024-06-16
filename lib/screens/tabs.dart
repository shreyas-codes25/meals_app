import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/screen_categories.dart';
import 'package:meals_app/screens/screen_meals.dart';

import '../data/dummy_data.dart';
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _sltpageindex =0;
  void _sltpage(int index){
    setState(() {
      _sltpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activePageTitle = "Categories";
    if (_sltpageindex == 1){
      activePage = MealsScreen( availableMeals: dummyMeals);
      activePageTitle = "Favorites";

    }
    return Scaffold(
      appBar: AppBar(
        title:Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _sltpageindex,
        onTap:_sltpage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: "categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "favorites")
        ],
      ),
    );
  }
}
