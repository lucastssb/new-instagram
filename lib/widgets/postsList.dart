import 'package:flutter/material.dart';
import '../widgets/postItem.dart';

import '../models/post.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;

  PostList({
    @required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return PostItem(post: posts[index]);
      },
      itemCount: posts.length,
    );
  }
}
