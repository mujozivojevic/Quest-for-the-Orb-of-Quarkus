import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:qoq_flutter/providers/maps_provider.dart';
import 'package:qoq_flutter/screens/player_items_screen.dart';

double percentage(int val1, int val2) {
  return val1.toDouble() / val2.toDouble();
}

class PlayerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapsProvider maps = Provider.of<MapsProvider>(context, listen: true);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/player.jpg'),
              radius: 50.0,
            ),
            SizedBox(height: 10.0),
            Text(
              maps.maps.player.name,
              style: TextStyle(color: Colors.white),
            ),
          ]),
          SizedBox(
            height: 150.0,
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'Health',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  new LinearPercentIndicator(
                    lineHeight: 20.0,
                    percent: maps.maps.player.isDeath == false
                        ? percentage(maps.maps.player.health,
                            maps.maps.player.levelHealth)
                        : 0.0,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                    center: Text(
                      '${maps.maps.player.health} / ${maps.maps.player.levelHealth}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Damage ',
                    // ${maps.maps.player.damage} ',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  new LinearPercentIndicator(
                    lineHeight: 20.0,
                    percent: percentage(
                        maps.maps.player.damage, maps.maps.player.levelDamage),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                    center: Text(
                        '${maps.maps.player.damage} / ${maps.maps.player.levelDamage}',
                        style: TextStyle(fontSize: 15.0)),
                  ),
                ],
              ),
            ),
          ),
        ]),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(PlayerItemsScreen.routeName);
          },
          child: Container(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/backpack.png'),
              radius: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
