import 'package:chandroidx/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileLinkButton extends StatelessWidget {
  final ProfileLink profileLink;

  const ProfileLinkButton({super.key, required this.profileLink});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _launchURL,
        child: SvgPicture.network(
          profileLink.svgUrl,
          width: 20,
          height: 20,
          color: profileLink.applyColor ? ChandroidColors.footerColor.color : null,
        ));
  }

  _launchURL() async {
    final uri = Uri.parse(profileLink.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${profileLink.url}';
    }
  }
}

class ProfileLink {
  final int id;
  final String svgUrl;
  final String url;
  final bool applyColor;

  ProfileLink({required this.id, required this.svgUrl, required this.url, required this.applyColor});

  factory ProfileLink.fromResponse(QueryDocumentSnapshot<Map<String, dynamic>> response) {
    return ProfileLink(id: response['id'], svgUrl: response['svg_url'], url: response['url'], applyColor: response['apply_color']);
  }
}
