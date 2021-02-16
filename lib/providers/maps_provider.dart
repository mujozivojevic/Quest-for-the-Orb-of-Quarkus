import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:qoq_flutter/models/maps.dart';

class MapsProvider extends ChangeNotifier {
  Maps maps = Maps();

  Future<void> addMaps(String playerName) async {
    final String apiUrl = 'http://10.0.2.2:8080/game/newgame';
    try {
      final response = await http.post(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'playerName': playerName,
        }),
      );
      maps = mapsFromJson(response.body);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> getMap(int id) async {
    final String apiUrl = 'http://10.0.2.2:8080/game/$id';
    try {
      final response = await http.get(
        apiUrl,
      );
      maps = mapsFromJson(response.body);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> move(int id) async {
    final String apiUrl = 'http://10.0.2.2:8080/game/$id/move';
    try {
      final response = await http.get(
        apiUrl,
      );
      maps = mapsFromJson(response.body);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> heal(int id) async {
    final String apiUrl = 'http://10.0.2.2:8080/game/$id/heal';
    try {
      final response = await http.get(
        apiUrl,
      );
      maps = mapsFromJson(response.body);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> item(int id) async {
    final String apiUrl = 'http://10.0.2.2:8080/game/$id/item';
    try {
      final response = await http.get(
        apiUrl,
      );
      maps = mapsFromJson(response.body);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> flee(int id) async {
    final String apiUrl = 'http://10.0.2.2:8080/game/$id/flee';
    try {
      final response = await http.get(
        apiUrl,
      );
      maps = mapsFromJson(response.body);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> fight(int id) async {
    final String apiUrl = 'http://10.0.2.2:8080/game/$id/fight';
    try {
      final response = await http.get(
        apiUrl,
      );
      maps = mapsFromJson(response.body);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
