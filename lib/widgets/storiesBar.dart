import 'package:flutter/material.dart';

import 'package:new_instagram/models/user.dart';

class StoriesBar extends StatefulWidget {
  final List<User> users;

  StoriesBar({@required this.users});
  @override
  _StoriesBarState createState() => _StoriesBarState();
}

class _StoriesBarState extends State<StoriesBar> {
  void _handleStoryPress(BuildContext ctx, User user) {
    Navigator.of(ctx).pushNamed(
      '/stories',
      arguments: user,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () => _handleStoryPress(context, widget.users[index]),
                child: Container(
                  width: 70,
                  height: 70,
                  padding: const EdgeInsets.all(1.5),
                  margin: const EdgeInsets.all(5),
                  child: Hero(
                    tag: widget.users[index].id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        widget.users[index].profileImageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 200, 50, 50),
                          width: 2),
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white),
                ),
              ),
              Text(widget.users[index].name),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: widget.users.length,
      ),
    );
  }
}
