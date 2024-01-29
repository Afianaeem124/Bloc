import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:blflutter/Model/post_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class PostRepo {
  Future<List<PostModel>> fetchAPI() async {
    try {
      final response = await get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      final body = jsonDecode(response.body) as List;
      if (kDebugMode) {
        print(response.statusCode.toString());
        //print(body);
      }
      if (response.statusCode == 200) {
        return body.map((dynamic json) {
          final map = json as Map<String, dynamic>;
          return PostModel(
            postId: map['postId'] as int,
            id: map['id'] as int,
            email: map['email'] as String,
            body: map['body'] as String,
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('error');
    }
    throw Exception('error Fetchin data');
  }
}
