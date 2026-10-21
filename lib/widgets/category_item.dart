import 'package:flutter/material.dart';
import 'package:mobile_travel_flutter/Screens/category_trips_screen.dart';
class CategoryItem extends StatelessWidget {
   CategoryItem({required this.title,required this.imageUrl,required this.Id});
 final String title;
 final String imageUrl;
 final String Id;
 void selectCategory(BuildContext ctx)
 {
    Navigator.of(ctx).pushNamed(
        CategoryTripsScreen.screenRoute,
        arguments: {
        'id': Id,
          'title':title,
        }
    );
 }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(title,
            style: Theme.of(context).textTheme.headlineSmall,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
          )
        ],
      ),
    );
  }
}
