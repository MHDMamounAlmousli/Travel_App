import 'package:flutter/material.dart';
import 'package:mobile_travel_flutter/app_data.dart';
class TripDetailScreen extends StatelessWidget {
  static const tripdetailScreen = '/trip_detail_screen';
  final Function _manageFavorite;
  final Function isFavorite;
  TripDetailScreen(this._manageFavorite,this.isFavorite);
  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final TripID = tripId['id'];
    final selectTrip = Trips_data.firstWhere((trip) => trip.id == TripID);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${selectTrip.title}',
        style: Theme.of(context).textTheme.headlineSmall,),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
         children: [
           Container(
             height: 300,
             width: double.infinity,
             child: Image.network(selectTrip.imageUrl,
               fit: BoxFit.cover,
             ),
           ),
           SizedBox(height:10,),
           buildContainer(context,'الانشطة'),
        buildListViewContainer(
          child: ListView.builder(
            itemCount: selectTrip.activities.length,
            itemBuilder: (context,index) => Card(
              elevation: 0.3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                child: Text(selectTrip.activities[index]),
              ),
            ),
          ),
        ),
           SizedBox(height:10,),
           buildContainer(context,'البرنامج اليومي'),
           buildListViewContainer(
             child: ListView.builder(
                 itemCount: selectTrip.program.length,
               itemBuilder: (context,index)=> Column(
                 children: [
                   ListTile(
                     leading: CircleAvatar(
                       child: Text(' يوم${index +1}'),
                     ),
                     title: Text('${selectTrip.program[index]}'),
                   ),
                   Divider(color: Colors.grey.withOpacity(0.2),),
                 ],
               ),
             ),
           ),
           SizedBox(height:100,),
         ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(TripID)?Icons.star:Icons.star_border,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () => _manageFavorite(TripID),
      ),
    );
  }

  Container buildContainer(BuildContext context,String titelText) {
    return Container(
         margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
         alignment: Alignment.topRight,
         child: Text('$titelText',
         style: Theme.of(context).textTheme.headlineMedium,),
       );
  }
}

Container buildListViewContainer({ required Widget child})
{
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      margin: EdgeInsets.symmetric(horizontal:15),
      child: child
  );
}
