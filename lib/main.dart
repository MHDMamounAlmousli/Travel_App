import 'package:flutter/material.dart';
import 'package:mobile_travel_flutter/Screens/FilterScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_travel_flutter/Screens/category_trips_screen.dart';
import 'package:mobile_travel_flutter/Screens/tabs_screen.dart';
import 'package:mobile_travel_flutter/Screens/trip_detail_screen.dart';
import 'Models/trip.dart';
import 'app_data.dart';
void main() => runApp(TravelApp());
class TravelApp extends StatefulWidget {
  const TravelApp({super.key});

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  Map<String, bool>_filters = {
    'summer': false,
    'winter': false,
    'family': false
  };
  List<Trip>_availableTrips = Trips_data;
  List<Trip>_favoriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String TripID)
  {
    final existindex = _favoriteTrips.indexWhere((trip) => trip.id == TripID);
    if(existindex >=0)
      {
        setState(() {
          _favoriteTrips.removeAt(existindex);
        });
      }else
        {
          setState(() {
            _favoriteTrips.add(Trips_data.firstWhere((trip)=> trip.id == TripID));
          });
        }
  }
  bool _isFavorite(String TripID)
  {
    return _favoriteTrips.any((trip) => trip.id == TripID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar','AE'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.amber,
        ),
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
          headlineMedium: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      routes: {
        CategoryTripsScreen.screenRoute:(context) => CategoryTripsScreen(_availableTrips),
        '/':(context) => TabsScreen(_favoriteTrips,),
        TripDetailScreen.tripdetailScreen:(context) => TripDetailScreen(_manageFavorite,_isFavorite),
        Filterscreen.screenFilter:(context) => Filterscreen(_changeFilters,_filters),
      },
    );
  }
}


