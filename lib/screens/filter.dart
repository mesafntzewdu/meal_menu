import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

enum FilterEnum {
  glutenFree,
  lactoseFree,
  vegetarian,
}

class _FilterState extends State<Filter> {
  bool _glutenVal = false;
  bool _lactoseVal = false;
  bool _veganVal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            FilterEnum.glutenFree: _glutenVal,
            FilterEnum.lactoseFree: _lactoseVal,
            FilterEnum.vegetarian: _veganVal,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              contentPadding: const EdgeInsets.only(left: 12, right: 12),
              value: _glutenVal,
              onChanged: (val) {
                setState(() {
                  _glutenVal = val;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.only(left: 12, right: 12),
              value: _lactoseVal,
              onChanged: (val) {
                setState(() {
                  _lactoseVal = val;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.only(left: 12, right: 12),
              value: _veganVal,
              onChanged: (val) {
                setState(() {
                  _veganVal = val;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
