import 'package:flutter/material.dart';
import 'package:mobile_travel_flutter/Screens/trip_detail_screen.dart';

import '../Models/trip.dart';
class TripItem extends StatelessWidget {
  const TripItem({required this.id ,required this.title, required this.imageUrl, required this.duration, required this.tripType, required this.season});
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  final String id;
  String get seasonText{
    switch (season)
    {
      case Season.Winter:
      return 'شتاء';
      break;
      case Season.Summer:
        return 'صيف';
        break;
      case  Season.Spring:
        return 'ربيع';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      default:
        return "unKnown";
    }
  }
  String get tripTypeText{
    switch (tripType)
    {
      case TripType.Activities:
        return 'انشطة';
        break;
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case  TripType.Recovery:
        return 'نقاهة';
        break;
      case TripType.Therapy:
        return 'معالجة';
        break;
      default:
        return "unKnown";
    }
  }
   void selectTrip(context){
    Navigator.of(context).pushNamed(
      TripDetailScreen.tripdetailScreen,
      arguments: {
        'id':id
      }
    );
   }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      borderRadius: BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
    ),

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children:<Widget> [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  height: 250,
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,
                        colors:[
                          Colors.black.withOpacity(0),Colors.black.withOpacity(0.8)
                        ],
                      stops: [
                        0.6,1
                      ]
                    ),
                  ),
                  child: Text(title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  overflow: TextOverflow.fade,),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 6,),
                      Text('$duration ايام '),

                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_twilight_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 6,),
                      Text('$seasonText'),

                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 6,),
                      Text('$tripTypeText'),

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
