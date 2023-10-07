import 'package:flutter/material.dart';
import 'package:subspace_blog_explorer/routes/route.dart' as route;
import 'package:subspace_blog_explorer/views/widgets/blog_post.dart';

class WhichBlog{
  final String id;
  const WhichBlog({
    required this.id,
});
}

class BlogCard extends StatelessWidget {
  final String title;
  final String id;
  final String image_url;
  const BlogCard({
    required this.id,
    required this.title,
    required this.image_url,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.30),
            BlendMode.multiply,
          ),
          image: NetworkImage(image_url),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),

                    ],
                  ),

                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(onPressed: () => Navigator.pushNamed(context, route.blogPost, arguments: {
                    'title': title,
                    'id': id,
                    'image_url': image_url,
                  })
                    ,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)
                        ),
                  ), child: const Row(
                    children: [
                      Text("Read Article"),
                      SizedBox(width: 7),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.yellow,
                        size: 18,
                      ),
                    ],
                  )
                )
                )],
            ),
          ),
        ],
      ),
    );
  }
}