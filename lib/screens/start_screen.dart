import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:qoq_flutter/providers/maps_provider.dart';
import 'package:qoq_flutter/screens/game_screen.dart';

import 'final_screen.dart';

class StartScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  static const routeName = '/start';

  @override
  Widget build(BuildContext context) {
    final MapsProvider mapsProvider =
        Provider.of<MapsProvider>(context, listen: true);
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: const Text(
            'Quest for the Orb of Quarkus',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[800],
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              CircleAvatar(
                backgroundImage: AssetImage('assets/player.jpg'),
                radius: 100.0,
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: TextField(
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: ('Enter your name'),
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  controller: _nameController,
                ),
              ),
              SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Start new game'),
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.tealAccent[700],
                      onSurface: Colors.black,
                      side: BorderSide(color: Colors.lightBlue[200], width: 1),
                      elevation: 60,
                      minimumSize: Size(150, 50),
                      shadowColor: Colors.teal),
                  onPressed: () async {
                    mapsProvider.addMaps(_nameController.text).then((value) =>
                        Navigator.of(context).pushNamed(GameScreen.routeName));
                  },
                ),
              )
            ],
          ),
        ));
  }
}
