// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Custom extends Equatable {
  const Custom(
      {this.name = '',
      this.email = '',
      this.long = '',
      this.width = '',
      this.height = '',
      this.description = '',
      this.productKind = 'Rock'});
  final String name;
  final String email;
  final String long;
  final String width;
  final String height;
  final String description;
  final String productKind;

  @override
  List<Object> get props =>
      [name, email, long, width, height, description, productKind];

  Custom copyWith({
    String? name,
    String? email,
    String? long,
    String? width,
    String? height,
    String? description,
    String? productKind,
  }) {
    return Custom(
      name: name ?? this.name,
      email: email ?? this.email,
      long: long ?? this.long,
      width: width ?? this.width,
      height: height ?? this.height,
      description: description ?? this.description,
      productKind: productKind ?? this.productKind,
    );
  }
}
