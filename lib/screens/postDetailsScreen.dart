import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/postItemDetails.dart';

import '../models/post.dart';

class PostDetailsScreen extends StatefulWidget {
  @override
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, Post>;
    final post = routeArguments['postData'];

    final AppBar appBar = AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
        ),
      ],
      elevation: 0,
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Hero(
              tag: 'id-post-${post.id}',
              child: PostItemDetails(
                post: post,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(0),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        post.user.profileImage,
                        fit: BoxFit.fill,
                        width: 45,
                      ),
                    ),
                    title: Text(post.user.name),
                    subtitle: Text(
                      post.comments[index].content.toString(),
                    ),
                  ),
                );
              },
              itemCount: post.comments.length,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: 10,
                  left: 10,
                  top: 10,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 250, 250, 250),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        post.user.profileImage,
                        fit: BoxFit.fill,
                        width: 45,
                      ),
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.send, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
