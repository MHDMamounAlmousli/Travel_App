import 'package:flutter/material.dart';
import 'package:mobile_travel_flutter/app_data.dart';
import '../widgets/category_item.dart';
class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7/8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: Category_data.map((categorydata) => CategoryItem(imageUrl: categorydata.imageUrl, title: categorydata.title,Id: categorydata.id,)).toList()
    );
  }
}
