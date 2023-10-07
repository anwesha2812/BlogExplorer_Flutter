import 'package:flutter/material.dart';
import 'package:subspace_blog_explorer/models/blog.api.dart';
import 'package:subspace_blog_explorer/views/widgets/blog_post.dart';

import '../models/blog.dart';

class BlogArticlePage extends StatefulWidget {  @override
_BlogArticlePageState createState() => _BlogArticlePageState();
}



class _BlogArticlePageState extends State<BlogArticlePage> {

  late List<Blog> _blogs;
  bool _isLoading=true;

  @override
  void initState(){
    super.initState();
    getBlogs();
  }

  Future<void> getBlogs() async{
    _blogs = await BlogsApi.fetchBlogs();
    setState(() {
      _isLoading=false;
    });
    print(_blogs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [
          Icon(Icons.text_snippet),
          SizedBox(width: 10),
          Text("Blog Explorer")
        ]),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()):
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article Title
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0), // Add spacing between title and image

            // Article Image
            Image.network(
              image_url,
              width: double.infinity, // Make the image take the full width
              height: 200.0, // Specify the desired height
              fit: BoxFit.cover, // Adjust how the image fits the container
            ),
            SizedBox(height: 16.0), // Add spacing between image and description

            // Article Description
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
      //     : ListView.builder(
      //     itemCount: _blogs.length,
      //     itemBuilder: (context, index){
      //       return BlogCard(
      //           id: _blogs[index].id,
      //           title: _blogs[index].title,
      //           image_url: _blogs[index].image_url
      //       );
      //
      //     }),
      // backgroundColor: Colors.black,
    );
  }
}