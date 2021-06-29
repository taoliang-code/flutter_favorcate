import 'package:flutter/material.dart';
import 'package:flutter_favorcate/common/size_fit.dart';
import 'package:flutter_favorcate/model/category_model.dart';
import 'package:flutter_favorcate/network/json_parse.dart';
import 'package:flutter_favorcate/pages/meal/meal.dart';
import 'package:flutter_favorcate/widgets/future_page_parse.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (ctx, snapshot) {
        final List<CategoryModel> categoryList = snapshot.data ?? [];
        final PageStatus status = snapshot.hasError
            ? PageStatus.error
            : snapshot.hasData
                ? PageStatus.success
                : PageStatus.wait;
        return FuturePageParse(
          status: status,
          child: HomeCategory(categoryList),
        );
      },
    );
  }
}

class HomeCategory extends StatelessWidget {
  final List<CategoryModel> _categoryList;
  const HomeCategory(this._categoryList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(40.rpx),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 40.rpx,
        mainAxisSpacing: 40.rpx,
        childAspectRatio: 1.5,
      ),
      itemCount: _categoryList.length,
      itemBuilder: (ctx, index) {
        return HomeCategoryItem(_categoryList[index]);
      },
    );
  }
}

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem(this.category, {Key? key}) : super(key: key);
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MealPage.routerName, arguments: category);
      },
      child: Container(
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(20.rpx),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(.5),
            category.color,
          ]),
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }
}
