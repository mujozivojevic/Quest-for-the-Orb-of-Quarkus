import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoq_flutter/models/item.dart';
import 'package:qoq_flutter/providers/maps_provider.dart';
import 'package:qoq_flutter/screens/game_screen.dart';

class PlayerItemsScreen extends StatelessWidget {
  static const routeName = '/items';

  @override
  Widget build(BuildContext context) {
    final MapsProvider maps = Provider.of<MapsProvider>(context, listen: true);
    bool hasItem = maps.maps.player.items != null ? true : false;

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('Quest for the Orb of Quarkus'),
        centerTitle: true,
      ),
      body: hasItem == true
          ? ListView.builder(
              itemCount: maps.maps.player.items.length,
              itemBuilder: (context, index) {
                final item = maps.maps.player.items[index];
                String name = item['name'];
                return Card(
                  child: ListTile(
                    title: Text(name),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/$name.png'),
                    ),
                    trailing: item['type'] == 'HealPotion'
                        ? Container(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () async {
                                await maps.heal(maps.maps.playerId).then(
                                    (value) => Navigator.of(context)
                                        .pushReplacementNamed(
                                            GameScreen.routeName));
                              },
                              child: Text('Heal'),
                            ),
                          )
                        : SizedBox(
                            width: 0.0,
                          ),
                  ),
                );
              })
          : Text(
              'No items in backpack',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
    );
  }
}
