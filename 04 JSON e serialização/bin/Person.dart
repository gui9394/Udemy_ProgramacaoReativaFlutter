import 'package:json_annotation/json_annotation.dart';

import 'Address.dart';

part 'Person.g.dart';

@JsonSerializable()
class Person {
  String name;
  String email;
  List<Address> addresses;

  Person();

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
