import 'package:flutter/material.dart';
import 'package:flutter_favorcate/generated/l10n.dart';
import 'package:flutter_favorcate/pages/home/home_content.dart';
import 'package:flutter_favorcate/pages/home/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favorcate),
        centerTitle: true,
      ),
      body: HomeContent(),
      drawer: HomeDrawer(),
    );
  }
}
