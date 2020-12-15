import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../models/historyIcon.dart';

class StoriesBar extends StatefulWidget {
  final List<HistoryIcon> historyIcons;

  StoriesBar({@required this.historyIcons});
  @override
  _StoriesBarState createState() => _StoriesBarState();
}

class _StoriesBarState extends State<StoriesBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 70,
                height: 70,
                padding: const EdgeInsets.all(1.5),
                margin: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    widget.historyIcons[index].imageUri,
                    fit: BoxFit.fill,
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 200, 50, 50),
                        width: 2),
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white),
              ),
              Text(widget.historyIcons[index].name),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: widget.historyIcons.length,
      ),
    );
  }
}
