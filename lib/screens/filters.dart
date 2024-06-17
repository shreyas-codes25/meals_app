
import 'package:flutter/material.dart';


class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;

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
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFree,
            onChanged: (isChecked){
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
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
