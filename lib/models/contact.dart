// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Contact {
  final String name;
  final String phopneNumber;
  Contact({
    required this.name,
    required this.phopneNumber,
  });

 Contact copyWith({
    String? name,
    String? phopneNumber,
  }) {
    return Contact(
      name: name ?? this.name,
      phopneNumber: phopneNumber ?? this.phopneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phopneNumber': phopneNumber,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'] as String,
      phopneNumber: map['phopneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) => Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Event(name: $name, phopneNumber: $phopneNumber)';

  @override
  bool operator ==(covariant Contact other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.phopneNumber == phopneNumber;
  }

  @override
  int get hashCode => name.hashCode ^ phopneNumber.hashCode;
}
