import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImg = data['isDaytime'] ? 'day2.jpeg' : 'night1.jpeg';
    Color bgColor = data['isDaytime'] ? Colors.cyanAccent : Colors.black54;


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/$bgImg'))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
          child: Column(children: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState((){

                  data = {
                    'location': result['location'],
                    'time': result['time'],
                    'isDaytime': result['isDaytime'],
                    'flag': result['flag'],
                  };

                });

              },
              icon: Icon(
                Icons.edit_location,
                color: Colors.grey[300],
              ),
              label: Text('Edit Location',
              style: TextStyle(
                color: Colors.grey[300],
              )),
            ),
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(data['location'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    letterSpacing: 3,
                  ))
            ]),
            SizedBox(
              height: 17,
            ),
            Text(data['time'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                ))
          ]),
        ),
      )),
    );
  }
}
