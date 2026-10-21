import 'package:flutter/material.dart';
import 'package:mobile_travel_flutter/Screens/FilterScreen.dart';
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:<Widget> [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.secondary,
            child: Text('دليلك السياحي',style: Theme.of(context).textTheme.headlineSmall,),
          ),
          SizedBox(height: 20,),
          ListTileBuild(title: 'الرحلات',icon:Icons.card_travel,onTapLink: (){
            Navigator.pushReplacementNamed(context,'/');
          },),
          ListTileBuild(title: 'التصفية',icon:Icons.filter_list,onTapLink: (){
            Navigator.pushReplacementNamed(context,Filterscreen.screenFilter);
          },),
        ],
      ),
    );
  }
}

class ListTileBuild extends StatelessWidget {
  const ListTileBuild({
    required this.title,required this.icon,required this.onTapLink
  });
final String title;
final IconData icon;
final VoidCallback  onTapLink;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 30,color: Colors.blueAccent,),
      title: Text(title,style: TextStyle(fontFamily: 'ElMessiri',fontWeight: FontWeight.bold,fontSize: 24),),
      onTap: onTapLink,
    );
  }
}
