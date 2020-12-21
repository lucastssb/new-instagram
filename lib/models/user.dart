import 'package:flutter/foundation.dart';

import 'story.dart';

class User {
  final int id;
  final String name;
  final String profileImageUrl;
  final List<Story> stories;

  const User({
    @required this.id,
    @required this.name,
    @required this.profileImageUrl,
    @required this.stories,
  });
}
