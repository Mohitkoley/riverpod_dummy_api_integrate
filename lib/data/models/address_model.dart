class AddressModel {
  final String id;
  final String name;
  final String street;
  final String city;
  final String zipCode;
  final String phoneNumber;

  AddressModel({
    required this.id,
    required this.name,
    required this.street,
    required this.city,
    required this.zipCode,
    required this.phoneNumber,
  });

  AddressModel copyWith({
    String? id,
    String? name,
    String? street,
    String? city,
    String? zipCode,
    String? phoneNumber,
  }) {
    return AddressModel(
      id: id ?? this.id,
      name: name ?? this.name,
      street: street ?? this.street,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  // Convert AddressModel to Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'street': street,
      'city': city,
      'zipCode': zipCode,
      'phoneNumber': phoneNumber,
    };
  }

  // Create AddressModel from Map (database row)
  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      street: map['street'] ?? '',
      city: map['city'] ?? '',
      zipCode: map['zipCode'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  @override
  String toString() {
    return 'AddressModel(id: $id, name: $name, street: $street, city: $city, zipCode: $zipCode, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AddressModel &&
        other.id == id &&
        other.name == name &&
        other.street == street &&
        other.city == city &&
        other.zipCode == zipCode &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        street.hashCode ^
        city.hashCode ^
        zipCode.hashCode ^
        phoneNumber.hashCode;
  }
}
