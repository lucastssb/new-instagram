import 'package:flutter/foundation.dart';
import '../models/user.dart';

class Post {
  int id;
  final User user;
  final int likesAmount;
  final int commentsAmount;
  final String image;

  Post({
    this.id,
    @required this.user,
    @required this.likesAmount,
    @required this.commentsAmount,
    @required this.image,
  });
}