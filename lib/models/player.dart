import 'item.dart';

class Player {
  Player({
    this.id,
    this.damage,
    this.health,
    this.levelDamage,
    this.levelHealth,
    this.items,
    this.isDeath,
    this.name,
  });

  int id;
  int damage;
  int health;
  int levelDamage;
  int levelHealth;
  List<dynamic> items;
  bool isDeath;
  String name;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        damage: (json["health"] < 0 ? 0 : json["damage"]),
        health: (json["health"] < 0 ? 0 : json["health"]),
        levelDamage: json["levelDamage"],
        levelHealth: json["levelHealth"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
        isDeath: json["isDeath"],
        name: json["name"],
      );
}
