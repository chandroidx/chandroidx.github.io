import 'dart:convert';

import 'package:chandroidx/base/footer/profile_link.dart';
import 'package:http/http.dart' as http;

class APIUtils {
  APIUtils._privateConstructor();

  static final APIUtils _instance = APIUtils._privateConstructor();

  factory APIUtils() {
    return _instance;
  }

  static const baseUrl = 'api.chandroidx.com:5020';

  static Uri _createUri(String route) {
    return Uri.https(baseUrl, route);
  }

  static Future<dynamic?> _requestAPI(String route) async {
    var response = await http.get(_createUri(route));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  static Future<List<dynamic>?> _requestListAPI(String route) async {
    var response = await http.get(_createUri(route));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  static Future<List<ProfileLink>> getProfileLinks() async {
    var body = await _requestListAPI('profile/get-links');
    var list = body?.map((e) => ProfileLink.fromJson(e)).toList();

    if (list == null) {
      return [];
    } else {
      return list;
    }
  }
}