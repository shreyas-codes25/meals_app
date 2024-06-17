
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/screen_categories.dart';
import 'package:meals_app/screens/screen_meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';



class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _togFavMeals(Meal meal) {
    final isexisting = _favMeals.contains(meal);
    if (isexisting) {
      setState(() {
        _favMeals.remove(meal);
      });
      _showInfoMessage("removed from favorites");
    } else {
      setState(() {
        _favMeals.add(meal);
      });
      _showInfoMessage("added to favorites");
    }
  }

  int _sltpageindex = 0;
  void _sltpage(int index) {
    setState(() {
      _sltpageindex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>const FilterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onTogFav: _togFavMeals,
    );
    var activePageTitle = "Categories";
    if (_sltpageindex == 1) {
      activePage =
          MealsScreen(onTogFav: _togFavMeals, availableMeals: _favMeals);
      activePageTitle = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSltScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _sltpageindex,
        onTap: _sltpage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "favorites")
        ],
      ),
    );
  }
}
