import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String? time;
  String flag;
  String url;
  bool? isLightOut;

  WorldTime(this.location, this.flag, this.url);

  Future<void> getTime() async {

    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //calculating the right time
      String offset = data['utc_offset'];
      String hrs = offset.substring(1,3);
      String min = offset.substring(4,6);
      String plusOrMinus = offset.substring(0,1);


      DateTime now = DateTime.parse(data['datetime']);
      if(plusOrMinus == "-")
        now = now.subtract(Duration(hours: int.parse(hrs), minutes: int.parse(min)));
      else
        now = now.add(Duration(hours: int.parse(hrs), minutes: int.parse(min)));

      isLightOut = (now.hour>=6 && now.hour<18) || (now.hour==18 && now.minute<=30) ? true : false;
      time = DateFormat.jm().format(now); //this is the time in India RN
    }
    catch(e) {
      print('caught error: $e');
      time = "ERROR: could not load time data";
    }



  }



}