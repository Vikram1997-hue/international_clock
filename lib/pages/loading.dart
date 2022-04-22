import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  //const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime wt = WorldTime('New Delhi', 'india.png', 'Asia/Kolkata');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isLightOut': wt.isLightOut,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
