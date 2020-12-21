import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_instagram/models/user.dart';
import '../dummyData.dart';
import '../models/post.dart';

class PostItemFooter extends StatelessWidget {
  final Post post;
  final bool showDescription;

  PostItemFooter({@required this.post, @required this.showDescription});

  @override
  Widget build(BuildContext context) {
    final List<User> users = DUMMY_USERS;
    

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(
                        width: 90.0,
                        height: 45.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.favorite,
                                color: Colors.red, size: 30),
                            Text(
                              post.likesAmount.toString() + 'k',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.comment,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    post.commentsAmount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.bookmark,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
        showDescription
            ? Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 40,
                      child: Stack(
                        children: [
                          Positioned(
                            width: 40,
                            height: 40,
                            left: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  users.firstWhere((user) => user.id == post.userId).profileImageUrl,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            width: 40,
                            height: 40,
                            left: 25,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  users.firstWhere((user) => user.id == post.userId).profileImageUrl,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            width: 40,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  users.firstWhere((user) => user.id == post.userId).profileImageUrl,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'I really like this picture...',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('More'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
