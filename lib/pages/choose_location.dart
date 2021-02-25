import 'package:flutter/material.dart';
import 'package:my_flutter_world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'greece.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'greece.png'),
  ];

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('choose location'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            //   var location = locations[index];
            return Card(
              child: ListTile(
                onTap: () {},
                title: Text('${locations[index].location}'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          },
        )
    );
  }
}
