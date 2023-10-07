import 'package:flutter/material.dart';

class BlogPost extends StatelessWidget{
  final String id;
  final String description;
  final String title;
  final String image_url;
  const BlogPost({
    required this.description,
    required this.id,
    required this.title,
    required this.image_url,
  });
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [
          Icon(Icons.arrow_back_ios),
          Text('Blog Post'),],
      )
      ),
      body: Center(
        child: Text(title, style: const TextStyle(
          fontSize: 24,
        ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center),

      ),
    );
  }
}
