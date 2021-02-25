import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      var dateTime = (data['datetime']);
      var offset = data['utc_offset'].toString().substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);

      if(now.hour > 18 || now.hour < 6){
        isDayTime = false;
      } else {
        isDayTime = true;
      }
    }
    catch(e){
      print(e);
      time = 'error';
    }


  }
}
