import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoq_flutter/providers/maps_provider.dart';
import 'package:qoq_flutter/screens/game_screen.dart';
import 'package:qoq_flutter/screens/start_screen.dart';
import 'package:qoq_flutter/widgets/message.dart';

class FinalScreen extends StatefulWidget {
  static const routeName = '/final';

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    final MapsProvider maps = Provider.of<MapsProvider>(context, listen: true);
    bool isTaken = false;
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: Text('Quest for the Orb of Quarkus'),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Orb Of Quarkus',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'LexendMega',
                      color: Colors.white),
                ),
                InkWell(
                  onTap: () async {},
                  child: Container(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/Orb of Quarkus.jpg'),
                      radius: 150.0,
                    ),
                  ),
                ),
                MessageWidget(),
                maps.maps.item != null
                    ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text('TAKE ITEM',
                              style: TextStyle(fontFamily: 'LexendMega')),
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: Colors.tealAccent[700],
                              onSurface: Colors.black,
                              side: BorderSide(
                                  color: Colors.lightBlue[200], width: 1),
                              elevation: 60,
                              minimumSize: Size(150, 50),
                              shadowColor: Colors.teal),
                          onPressed: () async {
                            await maps.item(maps.maps.playerId);
                          },
                        ),
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text('START AGAIN',
                              style: TextStyle(fontFamily: 'LexendMega')),
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: Colors.tealAccent[700],
                              onSurface: Colors.black,
                              side: BorderSide(
                                  color: Colors.lightBlue[200], width: 1),
                              elevation: 60,
                              minimumSize: Size(150, 50),
                              shadowColor: Colors.teal),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(StartScreen.routeName);
                          },
                        ),
                      )
              ],
            )));
  }
}
