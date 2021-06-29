import 'package:flutter/material.dart';
import 'package:flutter_favorcate/common/size_fit.dart';
import 'package:flutter_favorcate/generated/l10n.dart';
import 'package:flutter_favorcate/provider/filter_provider.dart';
import 'package:provider/provider.dart';

class FilterContent extends StatelessWidget {
  const FilterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitle(context),
        buildOptions(context),
      ],
    );
  }

  Widget buildTitle(BuildContext context) {
    return Container(
      height: 100.rpx,
      alignment: Alignment.center,
      child: Text(
        S.of(context).showChoice,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget buildOptions(BuildContext context) {
    return Expanded(
      child: Consumer<FilterProvider>(
        builder: (ctx, filterProvider, child) {
          return ListView(
            children: [
              buildOptionItem(
                title: S.of(context).glutenFree,
                subTitle: S.of(context).showGlutenFree,
                value: filterProvider.isGlutenFree,
                onChanged: (value) {
                  print(value);
                  filterProvider.isGlutenFree = value;
                },
              ),
              buildOptionItem(
                title: S.of(context).lactoseFree,
                subTitle: S.of(context).showLactoseFree,
                value: filterProvider.isLactoseFree,
                onChanged: (value) {
                  filterProvider.isLactoseFree = value;
                },
              ),
              buildOptionItem(
                title: S.of(context).vegetarian,
                subTitle: S.of(context).showVegetarian,
                value: filterProvider.isVegetarian,
                onChanged: (value) {
                  filterProvider.isVegetarian = value;
                },
              ),
              buildOptionItem(
                title: S.of(context).vegan,
                subTitle: S.of(context).showVegan,
                value: filterProvider.isVegan,
                onChanged: (value) {
                  filterProvider.isVegan = value;
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildOptionItem({
    required String title,
    required String subTitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
