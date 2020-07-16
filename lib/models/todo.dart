class Todos {
  static int id = 0;
  List<TodoDetail> items;

  Todos({this.items});
  factory Todos.initialize() => Todos(items: []);
  factory Todos.fromJSON(Map<String, dynamic> json) => Todos(
        items: json["items"],
      );

  Map<String, dynamic> toJson() => {
        "items": items,
      };
}

class TodoDetail {
  int id;
  String body;
  bool complited;

  TodoDetail({this.id, this.body, this.complited});

  factory TodoDetail.initialize() => TodoDetail(
        id: ++Todos.id,
        body: "",
        complited: false,
      );
  factory TodoDetail.fromJSON(Map<String, dynamic> json) => TodoDetail(
        id: json["id"],
        body: json["body"],
        complited: json["complited"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "body": body,
        "complited": complited,
      };
}
