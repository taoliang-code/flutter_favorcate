import 'package:flutter/material.dart';
import 'package:flutter_favorcate/common/size_fit.dart';
import 'package:flutter_favorcate/generated/l10n.dart';
import 'package:flutter_favorcate/pages/filter/filter.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450.rpx,
      child: Drawer(
        child: Column(
          children: [
            buildHeader(context),
            SizedBox(
              height: 40.rpx,
            ),
            buildOptions(
              context,
              Icon(Icons.restaurant),
              S.of(context).dine,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            buildOptions(
              context,
              Icon(Icons.filter_alt),
              S.of(context).filter,
              onTap: () {
                Navigator.of(context).pushNamed(FilterPage.routerName);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      height: 240.rpx,
      width: 450.rpx,
      alignment: Alignment(0, 0.5),
      color: Colors.orange,
      child: Text(
        S.of(context).justDoIt,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildOptions(
    BuildContext context,
    Icon icon,
    String title, {
    Function? onTap,
  }) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline2!.copyWith(
              fontWeight: FontWeight.normal,
            ),
      ),
      onTap: () {
        if (onTap != null) onTap();
      },
    );
  }
}
