import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  const Contact(
      {this.name = '',
      this.userEmail = '',
      this.subject = '',
      this.content = ''});

  final String name;
  final String userEmail;
  final String subject;
  final String content;

  @override
  List<Object> get props => [name, userEmail, subject, content];

  Contact copyWith({
    String? name,
    String? userEmail,
    String? subject,
    String? content,
  }) {
    return Contact(
      name: name ?? this.name,
      userEmail: userEmail ?? this.userEmail,
      subject: subject ?? this.subject,
      content: content ?? this.content,
    );
  }
}
