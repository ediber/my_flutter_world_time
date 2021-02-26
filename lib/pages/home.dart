import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  MaterialColor color;

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    if(data['isDayTime']){
      color = Colors.cyan;
    } else {
      color = Colors.blueGrey;
    }

    return Scaffold(
      backgroundColor: color,
      body: Column(
        children: [
          SizedBox(height: 100),
          FlatButton.icon(
            onPressed: () async{
              dynamic result = await Navigator.pushNamed(context, '/choose_location');
              setState(() {
                data = {
                  'location': result['location'],
                  'time': result['time'],
                  'flag ': result['flag'],
                  'isDayTime': result['isDayTime'],
                };
              });
            },
            icon: Icon(Icons.edit_location),
            label: Text('edit location'),
          ),
          Text(data['location']),
          // Text(data['flag']),
          Text(data['time']),
        ],
      ),
    );
  }
}
