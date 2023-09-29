class listview {
  String name;
  String age;

  listview({
    this.name,
    this.age,
  });

  factory listview.fromJson(Map<String, dynamic> json) {
    print("name" + json["name"]);
    return listview(
      name: json["name"],
      age: json["age"],
    );
  }
}
