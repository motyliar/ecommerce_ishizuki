// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  const Address({
    this.name = '',
    this.surname = '',
    this.email = '',
    this.street = '',
    this.city = '',
    this.numbers = '',
    this.country = '',
    this.zipCode = '',
    this.wishes = '',
  });

  final String name;
  final String surname;
  final String email;
  final String street;
  final String city;
  final String numbers;
  final String country;
  final String zipCode;
  final String wishes;

  @override
  List<Object> get props =>
      [name, surname, email, street, city, numbers, country, zipCode, wishes];

  Address copyWith({
    String? name,
    String? surname,
    String? email,
    String? street,
    String? city,
    String? numbers,
    String? country,
    String? zipCode,
    String? wishes,
  }) {
    return Address(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      street: street ?? this.street,
      city: city ?? this.city,
      numbers: numbers ?? this.numbers,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
      wishes: wishes ?? this.wishes,
    );
  }
}
