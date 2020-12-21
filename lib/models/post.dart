import 'package:flutter/foundation.dart';

import '../models/comment.dart';
import '../models/user.dart';

class Post {
  final int id;
  final int userId;
  final int likesAmount;
  final int commentsAmount;
  final String image;
  final List<Comment> comments;

  const Post({
    @required this.id,
    @required this.userId,
    @required this.likesAmount,
    @required this.commentsAmount,
    @required this.image,
    @required this.comments,
  });
}