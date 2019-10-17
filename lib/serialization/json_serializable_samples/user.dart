import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

///With json_serializable, you can forget any manual JSON serialization in the User class. The source code generator creates a file called user.g.dart, that has all the necessary serialization logic. You no longer have to write automated tests to ensure that the serialization works—it’s now the library’s responsibility to make sure the serialization works appropriately.

///To decode a JSON string the json_serializable way, you do not have actually to make any changes to our previous code.

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'user.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(nullable: false)
class User {
  final String name;
  final String email;
  @JsonKey(includeIfNull: false)
  final String secondName;

  ///If needed, it is also easy to customize the naming strategy. For example, if the API returns objects with snake_case, and you want to use lowerCamelCase in your models, you can use the @JsonKey annotation with a name parameter:
  /// Tell json_serializable that "registration_date_millis" should be
  /// mapped to this property.
  @JsonKey(name: 'registration_date_millis')
  int registrationDateMillis;

  @JsonKey(
      // map from and to the socialId
      name: 'socialId',

      // When deserializing take the socialId value and pass in to _profileLinkFromId
      fromJson: _socialNameFromId,

      // when serializing pass the string value of socialId into _idFromName and use that value
      toJson: _idFromName)
  final String profileLink;

  static String _socialNameFromId(int id) {
    if (id == 0) {
      return 'Facebook';
    }

    return 'Reddit';
  }

  static int _idFromName(String socialName) {
    if (socialName == 'FaceBook') {
      return 0;
    }

    return 1;
  }


  User(this.name, this.email, this.secondName, this.registrationDateMillis,
      this.profileLink);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
