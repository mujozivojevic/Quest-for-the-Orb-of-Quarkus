import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoq_flutter/providers/maps_provider.dart';
import 'package:qoq_flutter/screens/game_screen.dart';

class DungeonItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapsProvider maps = Provider.of<MapsProvider>(context, listen: true);
    bool item = maps.maps.item != null ? true : false;
    bool isDeath = maps.maps.player.isDeath;
    return (item == false || isDeath == true)
        ? Text('No more items and monster in this dungeon',
            style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 0.5,
                height: 2,
                color: Colors.white))
        : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(children: [
              InkWell(
                onTap: () async {
                  await maps.item(maps.maps.playerId);
                },
                child: Container(
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${maps.maps.item.name}.png'),
                    radius: 50.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                maps.maps.item.name,
                style: TextStyle(color: Colors.white),
              ),
            ]),
            Column(
              children: [
                Text(maps.maps.item.type,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Text(maps.maps.item.increaseBy.toString() + ' +',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    )),
              ],
            ),
          ]);
  }
}
