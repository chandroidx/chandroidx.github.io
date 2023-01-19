import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileLinkButton extends StatelessWidget {
  final String assetName;
  final String url;
  final Color? color;

  const ProfileLinkButton({super.key, required this.assetName, required this.url, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _launchURL,
        child: SvgPicture.asset(
          assetName,
          width: 20,
          height: 20,
          color: color,
        ));
  }

  _launchURL() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
