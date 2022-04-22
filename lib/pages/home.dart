import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map? data = {};
  //Map data = {};

  @override
  Widget build(BuildContext context) {

    //data = data.isNotEmpty ? ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>?; //data : ModalRoute.of(context).settings.arguments;
    if (data!.isEmpty) {
      data = ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>?;
    }


    String bgImage = data!['isLightOut'] ? 'daytime.jpg' : 'nighttime.jpg';
    //String bgImage = data['isLightOut'] ? 'daytime.jpg' : 'nighttime.jpg';

    //Color mybgColor = data!['isLightOut'] ? Colors.amberAccent : Colors.blue[900];

    return Scaffold(
      //backgroundColor: mybgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'time': result['time'],
                        'flag': result['flag'],
                        'isLightOut': result['isLightOut'],
                      };
                    });
                  },
                  label: Text(
                    "Edit Location",
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.0,
                    ),
                  ),
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data!['location'],
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.0,),

                Text(
                  data!['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
