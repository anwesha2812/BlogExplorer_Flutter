import 'package:flutter/material.dart';
import 'package:subspace_blog_explorer/views/widgets/blog_post.dart';
import 'package:subspace_blog_explorer/views/home.dart';
import 'package:subspace_blog_explorer/views/blog_article.dart';
import 'package:subspace_blog_explorer/views/widgets/blog_card.dart';

const String blogPost='blogPost';

Route<dynamic> controller(RouteSettings settings){
 final args=settings.arguments;
 print(args);
 switch(settings.name){
    case '/':
      return MaterialPageRoute(builder: (_)=>HomePage());
   case blogPost:
     if(args is Object){
       return MaterialPageRoute(builder: (_)=> BlogArticlePage()
       );
     }else{
       return MaterialPageRoute(builder: (_)=>HomePage());
     }
   default:
     return MaterialPageRoute(builder: (_)=>HomePage());

 }
}