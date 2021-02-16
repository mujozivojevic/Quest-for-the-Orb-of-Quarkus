import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:qoq_flutter/providers/maps_provider.dart';

double percentage(int val1, int val2) {
  return val1.toDouble() / val2.toDouble();
}

class EnemyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapsProvider maps = Provider.of<MapsProvider>(context, listen: true);
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Health',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            new LinearPercentIndicator(
              lineHeight: 20.0,
              percent: percentage(
                  maps.maps.monster.health, maps.maps.monster.health),
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
              center: Text(
                  '${maps.maps.monster.health} / ${maps.maps.monster.health}'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Damage',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            new LinearPercentIndicator(
              lineHeight: 20.0,
              percent: percentage(
                  maps.maps.monster.damage, maps.maps.monster.damage),
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
              center: Text(
                  '${maps.maps.monster.damage} / ${maps.maps.monster.damage}'),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Column(children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/${maps.maps.monster.name}.png'),
          radius: 50.0,
        ),
        SizedBox(height: 10.0),
        Text(
          '${maps.maps.monster.name}',
          style: TextStyle(color: Colors.white),
        ),
      ]),
    ]);
  }
}
