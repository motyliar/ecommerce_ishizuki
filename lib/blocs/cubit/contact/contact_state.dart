part of 'contact_cubit.dart';

enum TextFieldStatus { initial, name, email, subject, content, comeback }

class ContactState extends Equatable {
  final Contact contact;
  final TextFieldStatus status;
  const ContactState(this.contact, this.status);

  ContactState copyWith({Contact? contact, TextFieldStatus? status}) {
    return ContactState(contact ?? this.contact, status ?? this.status);
  }

  @override
  List<Object> get props => [contact, status];
}

final class ContactInitial extends ContactState {
  const ContactInitial()
      : super(const Contact(name: '', subject: '', userEmail: '', content: ''),
            TextFieldStatus.initial);
}
