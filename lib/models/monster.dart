class Monster {
  Monster({
    this.id,
    this.damage,
    this.health,
    this.name,
  });

  int id;
  int damage;
  int health;
  String name;

  factory Monster.fromJson(Map<String, dynamic> json) => Monster(
        id: json["id"],
        damage: json["damage"],
        health: json["health"],
        name: json["name"],
      );
}
