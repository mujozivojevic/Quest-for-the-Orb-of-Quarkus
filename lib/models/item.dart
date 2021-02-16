class Item {
  Item({
    this.name,
    this.type,
    this.increaseBy,
  });

  String name;
  String type;
  int increaseBy;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        type: json["type"],
        increaseBy: json["increaseBy"],
      );
}
