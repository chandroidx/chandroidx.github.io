import 'dart:convert';

import 'package:chandroidx/base/footer/profile_link.dart';
import 'package:chandroidx/blog/post.dart';
import 'package:chandroidx/home/skill.dart';
import 'package:chandroidx/portfolio/portfolio.dart';
import 'package:http/http.dart' as http;

class APIUtils {
  APIUtils._privateConstructor();

  static final APIUtils _instance = APIUtils._privateConstructor();

  factory APIUtils() {
    return _instance;
  }

  static const baseUrl = 'api.chandroidx.com:5020';

  static Uri _createUri(String route, {Map<String, dynamic>? queryParameters}) {
    return Uri.https(baseUrl, route, queryParameters);
  }

  static Future<dynamic?> _requestAPI(String route, {Map<String, dynamic>? queryParameters}) async {
    print(_createUri(route, queryParameters: queryParameters));
    var response = await http.get(_createUri(route, queryParameters: queryParameters));
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }

  static Future<List<dynamic>?> _requestListAPI(String route, {Map<String, dynamic>? queryParameters}) async {
    var response = await http.get(_createUri(route, queryParameters: queryParameters));
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }

  static Future<List<ProfileLink>> getProfileLinks() async {
    var body = await _requestListAPI('profile/get-links');
    var list = body?.map((e) => ProfileLink.fromJson(e)).toList();

    return list.nullOrEmpty();
  }

  static Future<List<Skill>> getProfileSkills() async {
    var body = await _requestListAPI('profile/get-skills');
    var list = body?.map((e) => Skill.fromJson(e)).toList();

    return list.nullOrEmpty();
  }

  static Future<List<Portfolio>> getPortfolios() async {
    var body = await _requestListAPI('portfolio/get-portfolios');
    var list = body?.map((e) => Portfolio.fromJson(e)).toList();

    return list.nullOrEmpty();
  }

  static Future<List<Post>> getPosts() async {
    var body = await _requestListAPI('blog/get-posts');
    var list = body?.map((e) => Post.fromJson(e)).toList();

    return list.nullOrEmpty();
  }

  static Future<Post> getPostDetail(String postId) async {
    print('blog/get-post-detail?post_id=$postId');
    var body = await _requestAPI(
      'blog/get-post-detail',
      queryParameters: {
        'post_id': postId,
      },
    );
    return Post.fromJson(body);
  }
}

extension ListExtension<T> on List<T>? {
  List<T> nullOrEmpty() {
    if (this == null) {
      return [];
    } else {
      return this!;
    }
  }
}
