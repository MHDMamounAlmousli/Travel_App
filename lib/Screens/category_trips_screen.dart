import 'package:flutter/material.dart';
import 'package:mobile_travel_flutter/Models/trip.dart';
import 'package:mobile_travel_flutter/widgets/Trip_item.dart';
class CategoryTripsScreen extends StatefulWidget {
  // const CategoryTripsScreen({required this.categoryId,required this.categoryTitle});
  // final String categoryId;
  // final String categoryTitle;
   static const screenRoute = '/category-trips';
  const CategoryTripsScreen( this.availableTrips);
   final List<Trip>availableTrips;
  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  String? categoryTitle;
  List<Trip>?displayTrips;
  @override
  void didChangeDependencies() {
    final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final categoryID = routeArgument['id'];
    categoryTitle = routeArgument['title']!;
    displayTrips = widget.availableTrips.where((Trip) {
      return Trip.categories.contains(categoryID);
    }).toList();
    super.didChangeDependencies();
  }
  void _removeItem(String tripID)
  {
      setState(() {
        displayTrips?.removeWhere((trip)=>trip.id == tripID);
      });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(categoryTitle!,style: Theme.of(context).textTheme.headlineMedium,),

      ),
      body: ListView.builder(
          itemBuilder: (context,index){
            return TripItem(
              id: displayTrips![index].id,
              title:displayTrips![index].title,
            imageUrl: displayTrips![index].imageUrl,
              duration: displayTrips![index].duration,
              tripType: displayTrips![index].tripType,
              season: displayTrips![index].season,
            );
          },
        itemCount: displayTrips?.length,
      ),
    );
  }
}
