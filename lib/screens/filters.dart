import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({required this.currentFilters, super.key});

  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarian = widget.currentFilters[Filter.vegetarian]!;
    _vegan = widget.currentFilters[Filter.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Filters",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFree,
            Filter.lactoseFree: _lactoseFree,
            Filter.vegetarian: _vegetarian,
            Filter.vegan: _vegan,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFree,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFree = isChecked;
                });
              },
              title: Text(
                "Gluten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              subtitle: Text(
                "only include gluten-free meals",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              inactiveThumbColor: Colors.red,
              activeThumbImage:
                  const AssetImage("assets/images/gluten-free.png"),
            ),
            SwitchListTile(
              inactiveThumbColor: Colors.red,
              activeThumbImage:
                  const AssetImage("assets/images/lactose-free.png"),
              value: _lactoseFree,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFree = isChecked;
                });
              },
              title: Text(
                "Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              subtitle: Text(
                "only include Lactose-free meals",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              inactiveThumbColor: Colors.red,
              activeThumbImage: const AssetImage("assets/images/vegan.png"),
              value: _vegan,
              onChanged: (isChecked) {
                setState(() {
                  _vegan = isChecked;
                });
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              subtitle: Text(
                "only include Vegan meals",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              inactiveThumbColor: Colors.red,
              activeThumbImage:
                  const AssetImage("assets/images/vegetarian.png"),
              value: _vegetarian,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarian = isChecked;
                });
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              subtitle: Text(
                "only include vegetarian meals",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
