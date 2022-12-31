// To parse this JSON data, do
//
//     final todosModel = todosModelFromJson(jsonString);

import 'dart:convert';

TodosModel todosModelFromJson(String str) => TodosModel.fromJson(json.decode(str));

String todosModelToJson(TodosModel data) => json.encode(data.toJson());

class TodosModel {
  TodosModel({
    required this.data,
  });

  List<Datum> data;

  factory TodosModel.fromJson(Map<String, dynamic> json) => TodosModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
