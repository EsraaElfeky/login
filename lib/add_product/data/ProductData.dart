import 'dart:convert';

class ProductResponse {
  String? name;
  ProductResponse({
    this.name
  });

  ProductResponse copyWith({
    String? name,
  }) {
    return ProductResponse(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory ProductResponse.fromMap(Map<String, dynamic> map) {
    return ProductResponse(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductResponse.fromJson(String source) => ProductResponse.fromMap(json.decode(source));

  @override
  String toString() => 'ProductResponse(name: $name)';
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductResponse &&
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
