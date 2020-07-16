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
  int completed;

  TodoDetail({this.id, this.body, this.completed});

  factory TodoDetail.initialize() => TodoDetail(
        id: ++Todos.id,
        body: "",
        completed: 0,
      );
  factory TodoDetail.fromJSON(Map<String, dynamic> json) => TodoDetail(
        id: json["id"],
        body: json["body"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "body": body,
        "completed": completed,
      };
}
