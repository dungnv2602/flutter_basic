import 'dart:convert';

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

main() {
  const jsonString = '{"User": {"name":"joe","email":"joe@gmail.com" }}';

  Map userMap = jsonDecode(jsonString);

  var user = User.fromJson(userMap);
  print('Howdy, ${user.name}!');
  print('We sent the verification link to ${user.email}.');

  ///To encode a user, pass the User object to the jsonEncode() function. You don’t need to call the toJson() method, since jsonEncode() already does it for you.

  String json = jsonEncode(user);
  print(json);
}
