import 'package:flutter/material.dart';
import 'package:flutter_favorcate/generated/l10n.dart';
import 'package:flutter_favorcate/pages/filter/filter_content.dart';

class FilterPage extends StatelessWidget {
  static const routerName = '/filter';
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).filter),
        centerTitle: true,
      ),
      body: FilterContent(),
    );
  }
}
