import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qoq_flutter/models/player.dart';

import 'item.dart';
import 'monster.dart';

Maps mapsFromJson(String str) => Maps.fromJson(json.decode(str));

class Maps {
  Maps({
    this.id,
    this.levelId,
    this.playerId,
    this.dungeonId,
    this.player,
    this.monster,
    this.item,
    this.isThere,
    this.message,
    this.isWin,
  });

  int id;
  int levelId;
  int playerId;
  int dungeonId;
  Player player;
  Monster monster;
  Item item;
  bool isThere;
  String message;
  bool isWin;

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        id: json["id"],
        levelId: json["levelId"],
        playerId: json["playerId"],
        dungeonId: json["dungeonId"],
        player: Player.fromJson(json["playerDto"]),
        monster: (json["monsterDto"] != null
            ? Monster.fromJson(json["monsterDto"])
            : null),
        item: (json["itemDto"] != null ? Item.fromJson(json["itemDto"]) : null),
        isThere: json["isThere"],
        message: json["message"],
        isWin: json["isWin"],
      );
}
