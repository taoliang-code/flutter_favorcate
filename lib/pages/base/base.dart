import 'package:flutter/material.dart';
import 'package:flutter_favorcate/generated/l10n.dart';
import 'package:flutter_favorcate/pages/favorite/favorite.dart';
import 'package:flutter_favorcate/pages/home/home.dart';

class BasePage extends StatefulWidget {
  static const routerName = '/';
  const BasePage({Key? key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          FavoritePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: S.of(context).favorite,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
