import 'dart:convert';

import 'package:chandroidx/utils/clickable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileLinkButton extends StatelessWidget {
  final ProfileLink profileLink;

  const ProfileLinkButton({super.key, required this.profileLink});

  @override
  Widget build(BuildContext context) {
    return Clickable(onClick: _launchURL, child: profileLink.svg);
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
  final SvgPicture svg;
  final String url;

  ProfileLink({required this.svg, required this.url});
}

final links = [
  ProfileLink(svg: SvgPicture.asset("assets/ico_instagram.svg", width: 20, height: 20), url: "https://instagram.com/ch_android"),
  ProfileLink(svg: SvgPicture.asset("assets/ico_github.svg", width: 20, height: 20), url: "https://github.com/chandroidx"),
];
