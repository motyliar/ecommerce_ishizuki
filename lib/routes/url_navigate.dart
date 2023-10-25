import 'package:url_launcher/url_launcher.dart';

class UrlNavigate {
  Future<void> launchFacebook() async {
    final Uri facebookUrl = Uri.parse('https://www.facebook.com/ishizukirocks');

    if (await canLaunchUrl(facebookUrl)) {
      await launchUrl(facebookUrl);
    }
    throw 'Could not launch $facebookUrl';
  }

  Future<void> launchInstagram() async {
    final Uri instagramUrl =
        Uri.parse('https://www.instagram.com/ishizukirocks');

    if (await canLaunchUrl(
      instagramUrl,
    )) {
      launchUrl(instagramUrl);
    } else {
      throw 'Could not launch $instagramUrl';
    }
  }
}
