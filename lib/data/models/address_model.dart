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
}
