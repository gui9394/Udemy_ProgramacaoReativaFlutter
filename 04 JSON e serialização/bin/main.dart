import 'Address.dart';
import 'Person.dart';
import 'dart:convert';

main(List<String> arguments) {
  Map<String, dynamic> meuJSON = {
    'name': 'name',
    'email': 'name@name.com.br',
    'addresses': [
      {'id': 1, 'name': 'Narnia'},
      {'id': 2, 'name': 'Disney'}
    ]
  };

  Person p = Person.fromJson(meuJSON);

  print(p.name);
  print(p.email);
  p.addresses.forEach((address) => print(address.name));

  var j = jsonEncode(p);

  print(j);
}
