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
      this.productKind = 'Rock',
      this.base64 = ''});
  final String name;
  final String email;
  final String long;
  final String width;
  final String height;
  final String description;
  final String productKind;
  final String base64;

  @override
  List<Object> get props =>
      [name, email, long, width, height, description, productKind, base64];

  Custom copyWith({
    String? name,
    String? email,
    String? long,
    String? width,
    String? height,
    String? description,
    String? productKind,
    String? base64
  }) {
    return Custom(
      name: name ?? this.name,
      email: email ?? this.email,
      long: long ?? this.long,
      width: width ?? this.width,
      height: height ?? this.height,
      description: description ?? this.description,
      productKind: productKind ?? this.productKind,
      base64 : base64 ?? this.base64
    );
  }
}
