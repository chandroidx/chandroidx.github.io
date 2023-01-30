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
    return Clickable(
        onClick: _launchURL,
        child: SvgPicture.network(
          profileLink.svgUrl,
          width: 20,
          height: 20,
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
  final String svgUrl;
  final String url;

  ProfileLink({required this.svgUrl, required this.url});

  factory ProfileLink.fromJson(dynamic json) {
    return ProfileLink(svgUrl: json['svg_url'], url: json['url']);
  }
}
