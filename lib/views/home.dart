import 'package:flutter/material.dart';
import 'package:subspace_blog_explorer/models/blog.api.dart';
import 'package:subspace_blog_explorer/views/widgets/blog_card.dart';
import '../models/blog.dart';

class HomePage extends StatefulWidget {  @override
_HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

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
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
          itemCount: _blogs.length,
          itemBuilder: (context, index){
            return BlogCard(
              id: _blogs[index].id,
              title: _blogs[index].title,
              image_url: _blogs[index].image_url
            );

          }),
          backgroundColor: Colors.black,
      );
  }
}