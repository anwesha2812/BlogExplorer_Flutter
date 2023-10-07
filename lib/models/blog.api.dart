import 'dart:convert';

import 'package:http/http.dart' as http;

import 'blog.dart';
class BlogsApi{

  static Future<List<Blog>> fetchBlogs() async {
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
    List temp=[];
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        print('Response data: ${response.body}');
        Map data = jsonDecode(response.body);

        for(var i in data['blogs']){
          temp.add(i);
        }
        return Blog.blogFromSnapshot(temp);


      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
        return Blog.blogFromSnapshot(temp);
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error: $e');
      return Blog.blogFromSnapshot(temp);
    }
  }

  void main() {
    fetchBlogs();
  }
}

