
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDaytime']?'day.jpg': 'night.jpg';
    Color bgColor=data['isDaytime']?const Color.fromARGB(255, 36, 122, 148) : const Color.fromARGB(255, 18, 9, 41);
    Color txtColor=data['isDaytime']? const Color.fromARGB(255, 0, 0, 0) : Colors.white;
    return Scaffold(
      backgroundColor:bgColor ,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit:BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,180.0,0,0),
            child: Column(
              children: [
                 SizedBox(height: 20.0),
                 Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: txtColor,
                  ),
                 ),
                   SizedBox(height: 20.0,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: txtColor,
                          
                        ),
                        ),
                    ],
                   ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: ()async{
                   dynamic result = await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data ={
                      'time':result['time'],
                      'location':result['location'],
                      'isDaytime':result['isDaytime'],
                      'flag':result['flag']
                     };
                   });

                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: const Color.fromARGB(255, 199, 129, 24),
                    ),
                   label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: txtColor
                    ),
                   
                    ),
                   ),
                 ],
              ),
          ),
        )
        ),
    );
  }
}