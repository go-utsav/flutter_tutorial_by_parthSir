// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Hobby {
  int id;
  String name;

  Hobby({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Hobby.fromMap(Map<String, dynamic> map) {
    return Hobby(
      id: map['id'] as int,
      name: map['hobby_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hobby.fromJson(String source) =>
      Hobby.fromMap(json.decode(source) as Map<String, dynamic>);
}
