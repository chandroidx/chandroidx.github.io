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
        child: SvgPicture.asset(
          profileLink.asset,
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
  final String asset;
  final String url;
  final bool applyColor;

  ProfileLink({required this.asset, required this.url, required this.applyColor});

  static final links = [
    ProfileLink(asset: 'assets/ico_github.svg', url: 'https://github.com/chandroidx', applyColor: true),
    ProfileLink(asset: 'assets/ico_instagram.svg', url: 'https://instagram.com/ch_android', applyColor: false),
  ];
}
