import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';

import 'package:url_launcher/url_launcher.dart';

class UrlNavigate {
  Future<void> launchFacebook() async {
    final Uri facebookUrl = Uri.parse(kFacebookUrl);

    if (await canLaunchUrl(facebookUrl)) {
      await launchUrl(facebookUrl);
    }
    Utils.printDebugError(errorMessage: facebookUrl.toString());
  }

  Future<void> launchInstagram() async {
    final Uri instagramUrl = Uri.parse(kInstagramUrl);

    if (await canLaunchUrl(
      instagramUrl,
    )) {
      launchUrl(instagramUrl);
    } else {
      Utils.printDebugError(errorMessage: instagramUrl.toString());
    }
  }
}
