import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileLinkButton extends StatelessWidget {
  final String svgUrl;
  final String url;
  final Color? color;

  const ProfileLinkButton({super.key, required this.svgUrl, required this.url, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _launchURL,
        child: SvgPicture.network(
          svgUrl,
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

class ProfileLink {
  final String svgUrl;
  final String url;
  final bool applyColor;

  ProfileLink({required this.svgUrl, required this.url, required this.applyColor});

  factory ProfileLink.fromResponse(QueryDocumentSnapshot<Map<String, dynamic>> response) {
    return ProfileLink(svgUrl: response['svg_url'], url: response['url'], applyColor: response['apply_color']);
  }
}
