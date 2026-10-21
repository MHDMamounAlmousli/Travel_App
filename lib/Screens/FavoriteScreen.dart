import 'package:flutter/material.dart';

import '../Models/trip.dart';
import '../widgets/Trip_item.dart';
class Favoritescreen extends StatelessWidget {
  const Favoritescreen(this.favoriteTrips);
  final List<Trip> favoriteTrips;
  @override
  Widget build(BuildContext context) {
    if(favoriteTrips .isEmpty)
      {
        return Center(
          child: Text('ليس لديك اي رحلة مفضلة'),
        );
      }
      else
        {
          return ListView.builder(
            itemBuilder: (context,index){
              return TripItem(
                id: favoriteTrips![index].id,
                title:favoriteTrips![index].title,
                imageUrl: favoriteTrips![index].imageUrl,
                duration: favoriteTrips![index].duration,
                tripType: favoriteTrips![index].tripType,
                season: favoriteTrips![index].season,
              );
            },
            itemCount: favoriteTrips?.length,
          );
        }
  }
}
