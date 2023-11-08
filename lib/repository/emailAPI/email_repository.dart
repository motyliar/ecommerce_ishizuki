import 'dart:convert';

import 'package:http/http.dart' as http;

class EmailRepository {
  Future<void> sendConfirmEmailToUser(
      {required String userName,
      required String userEmail,
      required String orderSymbol}) async {
    const serviceId = 'service_loy3rqq';
    const templateId = 'template_cwp9sg7';
    const userId = 'cdT7F_odFHGuBXuh3';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': userName,
            'user_email': userEmail,
            'user_order': orderSymbol
          }
        }));
  }

  Future<String> sendContactEmail(
      {required String userName,
      required String emailSubject,
      required String userEmail,
      required String emailContent}) async {
    const serviceId = 'service_loy3rqq';
    const templateId = 'template_o2jg9yo';
    const userId = 'cdT7F_odFHGuBXuh3';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': userName,
            'user_subject': userEmail,
            'user_userEmail': emailSubject,
            'user_content': emailContent
          }
        }));

    return response.body;
  }
}
