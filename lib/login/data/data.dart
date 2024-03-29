import 'dart:convert';

class LoginRsponces {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;

  LoginRsponces({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
  });

  LoginRsponces copyWith({
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    String? token,
  }) {
    return LoginRsponces(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image,
      'token': token,
    };
  }

  factory LoginRsponces.fromMap(Map<String, dynamic> map) {
    return LoginRsponces(
      id: map['id']?.toInt() ?? 0,
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      gender: map['gender'] ?? '',
      image: map['image'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRsponces.fromJson(String source) => LoginRsponces.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoginRsponces(id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, gender: $gender, image: $image, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginRsponces &&
      other.id == id &&
      other.username == username &&
      other.email == email &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.gender == gender &&
      other.image == image &&
      other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      username.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      gender.hashCode ^
      image.hashCode ^
      token.hashCode;
  }
}
