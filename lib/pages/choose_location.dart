import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  //const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> alllocations = [
    WorldTime('New Delhi', 'india.png', 'Asia/Kolkata'),
    WorldTime('Berlin', 'germany.png', 'Europe/Berlin'),
    WorldTime('London', 'uk.png', 'Europe/London'),
    WorldTime('Athens', 'greece.png', 'Europe/Berlin'),
    WorldTime('Cairo', 'egypt.png', 'Africa/Cairo'),
    WorldTime('Nairobi', 'kenya.png', 'Africa/Nairobi'),
    WorldTime('New York', 'usa.png', 'America/New_York'),
    WorldTime('Seoul', 'south_korea.png', 'Asia/Seoul'),
    WorldTime('Jakarta', 'indonesia.png', 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime item = alllocations[index];
    await item.getTime();
    Navigator.pop(context, {
      'location': item.location,
      'flag': item.flag,
      'time': item.time,
      'isLightOut': item.isLightOut,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Choose a Location',
          style: TextStyle(
            letterSpacing: 0.7,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: alllocations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3.0),
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                    "${alllocations[index].location}"
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('${ alllocations[index].flag }'),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal:10.0),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
