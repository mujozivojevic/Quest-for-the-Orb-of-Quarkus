import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoq_flutter/providers/maps_provider.dart';
import 'package:qoq_flutter/screens/final_screen.dart';
import 'package:qoq_flutter/screens/start_screen.dart';
import 'package:qoq_flutter/widgets/dungeon_item.dart';
import 'package:qoq_flutter/widgets/enemy.dart';
import 'package:qoq_flutter/widgets/message.dart';
import 'package:qoq_flutter/widgets/player.dart';

class GameScreen extends StatefulWidget {
  static const routeName = '/game';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MapsProvider mapsProvider =
        Provider.of<MapsProvider>(context, listen: true);

    final maps = Provider.of<MapsProvider>(context);
    bool lastMonster = false;
    bool monster = mapsProvider.maps.monster != null ? true : false;
    if (monster) {
      lastMonster = maps.maps.monster.name == 'Big Boss' ? true : false;
    }
    bool item = mapsProvider.maps.item != null ? true : false;
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: Text('Level : ${maps.maps.levelId.toString()}'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mapsProvider.maps.monster != null
                  ? EnemyWidget()
                  : DungeonItemWidget(),
              SizedBox(height: 10.0),
              PlayerWidget(),
              MessageWidget(),
              SizedBox(height: 10.0),
              maps.maps.player.isDeath == false
                  ? monster == true
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              child: Text(
                                'FIGHT',
                                style: TextStyle(
                                  fontFamily: 'LexendMega',
                                  fontSize: 15.0,
                                ),
                              ),
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
                                Future<void> change() async {
                                  await mapsProvider.fight(maps.maps.playerId);
                                  print('testFirst');
                                }

                                change().then((value) => {
                                      monster =
                                          mapsProvider.maps.monster != null
                                              ? true
                                              : false,
                                      item = mapsProvider.maps.item != null
                                          ? true
                                          : false,
                                      if (monster == false && item == true)
                                        {
                                          print('$monster' +
                                              ' ' +
                                              '$item ' +
                                              maps.maps.item.type),
                                          if (maps.maps.item.type == 'Final' &&
                                              maps.maps.player.isDeath == false)
                                            {
                                              print('then 3'),
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      FinalScreen.routeName)
                                            }
                                        }
                                    });
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            lastMonster == false
                                ? ElevatedButton(
                                    child: Text(
                                      'FLEE',
                                      style: TextStyle(
                                        fontFamily: 'LexendMega',
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        onPrimary: Colors.white,
                                        primary: Colors.red[300],
                                        onSurface: Colors.black,
                                        side: BorderSide(
                                            color: Colors.lightBlue[200],
                                            width: 1),
                                        elevation: 60,
                                        minimumSize: Size(150, 50),
                                        shadowColor: Colors.teal),
                                    onPressed: () async {
                                      await mapsProvider
                                          .flee(maps.maps.playerId);
                                    },
                                  )
                                : SizedBox(
                                    height: 0.0,
                                  ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 50.0,
                            ),
                            // ElevatedButton(
                            //   onPressed: () async {
                            //     await mapsProvider.move(mapsProvider.maps.playerId);
                            //   },
                            //   child: Text('MOVE'),
                            //   style: ElevatedButton.styleFrom(
                            //       onPrimary: Colors.white,
                            //       primary: Theme.of(context).primaryColor,
                            //       onSurface: Colors.grey,
                            //       side: BorderSide(color: Colors.purple, width: 1),
                            //       elevation: 10,
                            //       minimumSize: Size(150, 50),
                            //       shadowColor: Colors.teal),
                            // ),
                            ElevatedButton(
                              child: Text(
                                'MOVE',
                                style: TextStyle(
                                  fontFamily: 'LexendMega',
                                  fontSize: 15.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.white,
                                  primary: Colors.red[300],
                                  onSurface: Colors.black,
                                  side: BorderSide(
                                      color: Colors.lightBlue[200], width: 1),
                                  elevation: 60,
                                  minimumSize: Size(150, 50),
                                  shadowColor: Colors.teal),
                              onPressed: () async {
                                await mapsProvider.move(maps.maps.playerId);
                              },
                            )
                          ],
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
          ),
        ));
  }
}
