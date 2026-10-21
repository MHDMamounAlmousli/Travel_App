import 'package:flutter/material.dart';
import 'package:mobile_travel_flutter/Screens/HomeScreen.dart';
import 'package:mobile_travel_flutter/widgets/app_drawer.dart';
import '../Models/trip.dart';
import 'FavoriteScreen.dart';
class TabsScreen extends StatefulWidget {
  TabsScreen(this.favoriteTrips);
  final List<Trip>favoriteTrips;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }
  int _selectedScreenIndex = 0;
  late List<Map<String,dynamic>> _screens;
  @override
  void initState() {
    _screens = [
      {
        'Screen': Homescreen(),
        'Title': ' تصنيفات الرحلات'
      },
      {
        'Screen':Favoritescreen(widget.favoriteTrips),
        'Title': ' الرحلات المفضلة'
      }

    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white,size: 30),
           centerTitle: true,
           backgroundColor: Theme.of(context).primaryColor,
           title: Text(_screens[_selectedScreenIndex]['Title'],style: Theme.of(context).textTheme.headlineSmall,),
        ),
      body: _screens[_selectedScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        selectedLabelStyle: TextStyle(
                   color: Colors.white,
                   fontFamily: 'ElMessiri',
                   fontWeight: FontWeight.bold,
                 ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
              label:'التصنيفات'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label:'المفضلة',

          )
        ],
      ),
    );
  }
}







//this is class for appBar Tab
// class TabsScreen extends StatelessWidget {
//   const TabsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Theme.of(context).primaryColor,
//           title: Text('الدليل السياحي',style: Theme.of(context).textTheme.headlineSmall,),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.dashboard,color: Colors.white,),
//                 child: Text('التصنيفات',style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'ElMessiri',
//                   fontWeight: FontWeight.bold,
//                 ),),
//               ),
//               Tab(
//                 icon: Icon(Icons.star,color: Colors.white,),
//                 child:Text('المفضلة',style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'ElMessiri',
//                   fontWeight: FontWeight.bold,
//                 )),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Homescreen(),
//             Favoritescreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
