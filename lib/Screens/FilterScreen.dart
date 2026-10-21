import 'package:flutter/material.dart';
import 'package:mobile_travel_flutter/widgets/app_drawer.dart';
class Filterscreen extends StatefulWidget {
  const Filterscreen(this.saveFilters,this.currentfilters);
static const screenFilter = '/Filters';
final Function saveFilters;
final Map<String,bool> currentfilters;
  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamily = false;
  @override
  void initState() {
    // TODO: implement initState
    _isInSummer = widget.currentfilters['summer']!;
    _isInWinter = widget.currentfilters['winter']!;
    _isForFamily = widget.currentfilters['family']!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(iconTheme: IconThemeData(color:Colors.white),backgroundColor: Theme.of(context).primaryColor,centerTitle: true,title: Text('الفلترة',style: Theme.of(context).textTheme.headlineSmall,),
      actions: [
        IconButton(onPressed:()
            {
            final selectedFilters = {
              'summer':_isInSummer,
              'winter':_isInWinter,
              'family':_isForFamily
            };
              widget.saveFilters(selectedFilters);

            },
            icon: Icon(Icons.save))
      ],),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(context,'الرحلات الصيفية','اظهار الرحلات في فصل الصيف فقط',_isInSummer,(newValue){
                  setState(() {
                    _isInSummer = newValue;
                  });
                }),
                buildSwitchListTile(context,'الرحلات الشتوية','اظهار الرحلات في فصل الشتاء فقط',_isInWinter,(newValue){
                  setState(() {
                    _isInWinter = newValue;
                  });
                }),
                buildSwitchListTile(context,'للعائلات','اظهار الرحلات للعائلات فقط',_isForFamily,(newValue){
                  setState(() {
                    _isForFamily = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      )
    );
  }

  SwitchListTile buildSwitchListTile(BuildContext context,String Title,String SubTitle,var value, UpdateValue) {
    return SwitchListTile(
                activeColor: Theme.of(context).colorScheme.secondary,
                inactiveTrackColor: Colors.grey,
                value: value,
                onChanged: UpdateValue,
                title: Text(Title,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                subtitle: Text(SubTitle,style: TextStyle(color: Colors.grey.shade800),),
              );
  }
}