import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileLinkButton extends StatelessWidget {
  final String assetName;
  final String url;

  const ProfileLinkButton({super.key, required this.assetName, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: _launchURL, child: SvgPicture.asset(assetName, width: 20, height: 20));
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
