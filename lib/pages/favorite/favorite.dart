import 'package:flutter/material.dart';
import 'package:flutter_favorcate/generated/l10n.dart';
import 'package:flutter_favorcate/pages/favorite/favorite_content.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).myFavorite),
        centerTitle: true,
      ),
      body: FavoriteContent(),
    );
  }
}
