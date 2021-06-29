import 'package:flutter/material.dart';
import 'package:flutter_favorcate/common/size_fit.dart';
import 'package:flutter_favorcate/model/meal_model.dart';

class MealDetailContent extends StatelessWidget {
  final MealModel _meal;
  const MealDetailContent(this._meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBanner(),
          buildTile(context, '制作材料'),
          buildMakeMaterial(context),
          buildTile(context, '步骤'),
          buildMakeStep(),
          SizedBox(
            height: 100.rpx,
          )
        ],
      ),
    );
  }

  // 1. 顶部图片
  Widget buildBanner() {
    return Image.network(
      _meal.imageUrl,
      width: 750.rpx,
      height: 550.rpx,
      fit: BoxFit.cover,
    );
  }

  // 2. 制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return custContainer(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _meal.ingredients.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.rpx,
                horizontal: 20.rpx,
              ),
              child: Text(
                _meal.ingredients[index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }

  // 3. 制作步骤
  Widget buildMakeStep() {
    return custContainer(
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _meal.steps.length,
        separatorBuilder: (ctx, index) {
          return Divider(
            indent: 20.rpx,
            endIndent: 20.rpx,
          );
        },
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('#${index + 1}'),
            ),
            title: Text(_meal.steps[index]),
          );
        },
      ),
    );
  }

  // 标题
  Widget buildTile(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.rpx),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  // 公共container
  Widget custContainer({required Widget child}) {
    return Container(
      width: 690.rpx,
      padding: EdgeInsets.all(8.rpx),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.rpx),
        border: Border.all(color: Colors.grey),
      ),
      child: child,
    );
  }
}
