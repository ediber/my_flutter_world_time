import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:my_flutter_world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
/*  void getFakeData() async{
    // simulate network request
    String res1 = await Future.delayed(Duration(seconds: 3), (){
      return 'delayed result';
    });

    String res2 = await Future.delayed(Duration(seconds: 1), (){
      return res1 + ' 2';
    });

    print(res2);
  }*/

/*  void getData() async {
    Response response =
        await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);
  }*/

  String time = 'loading';

  void setupWorldTime() async{
    WorldTime instance =
        WorldTime(location: 'Berlin', flag: '.png', url: 'Europe/Berlin');

    await instance.getTime();
    setState(() {
      time = instance.time;
    });

    // remove last widget from stack
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

   @override
  void initState() {
    super.initState();
   // print('init');
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Text('$time'),
          ),
          SpinKitRotatingCircle(
            color: Colors.white,
            size: 100,
          )
        ],
      ),
    );
  }
}
