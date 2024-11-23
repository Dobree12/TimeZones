import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  
  var location; // location name for the UI
  var time; // the time in that location
  var flag; // url to an asset flag icon
  var url; // location url for api endpoint
  bool isDaytime=true; // true or false if is daytime or not
  
  WorldTime({required this.location,required this.flag,required this.url});


  Future <void> getTime() async {
  
    try{

    var url_to_uri = Uri.parse('https://www.timeapi.io/api/time/current/zone?timeZone=$url');
    var response = await http.get(url_to_uri);
    Map data = jsonDecode(response.body);
   // print(data);
    //get propreties from data

    var datetime=data['dateTime'];
    //String offset=data['offset'];

    //print(datetime);
    //print(offset);

    //create DateTime obj
    DateTime now = DateTime.parse(datetime);
    isDaytime = now.hour < 6 && now.hour < 20 ? true: false;
    time = DateFormat.jm().format(now);
    }

    catch(e){
      print('cought error :$e');
      time='could not get time data';
    }
  }
}
