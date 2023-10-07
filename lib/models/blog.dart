class Blog{
  final String id;
  final String title;
  final String image_url;


  Blog({required this.id,required this.title,required this.image_url});

  factory Blog.fromJson(dynamic json){
    return Blog(
      id: json['id'] as String,
      title: json['title'] as String,
      image_url: json['image_url'] as String
    );
  }

static List<Blog> blogFromSnapshot(List snapshot){
    return snapshot.map((data){
      return Blog.fromJson(data);
    }).toList();
}

}