import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
   List<WorldTime> locations = [
	    WorldTime(url: 'Europe%2FLondon', location: 'London', flag: 'uk.png'),
	    WorldTime(url: 'Europe%2FAthens', location: 'Athens', flag: 'greece.png'),
	    WorldTime(url: 'Africa%2FCairo', location: 'Cairo', flag: 'egypt.png'),
	    WorldTime(url: 'Africa%2FNairobi', location: 'Nairobi', flag: 'kenya.png'),
	    WorldTime(url: 'America%2FChicago', location: 'Chicago', flag: 'usa.png'),
	    WorldTime(url: 'America%2FNew_York', location: 'New York', flag: 'usa.png'),
	    WorldTime(url: 'Asia%2FSeoul', location: 'Seoul', flag: 'south_korea.png'),
	    WorldTime(url: 'Asia%2FJakarta', location: 'Jakarta', flag: 'indonesia.png'),
	  ];

    void updateTime(index)async{
      WorldTime instance = locations[index];
      await instance.getTime();
      //navigate to homescreen
      Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
      }
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Chose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
          child: Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
                },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          ),
        );
        }
        )
    );
  }
}