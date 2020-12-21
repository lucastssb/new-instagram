import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_instagram/models/story.dart';
import 'package:new_instagram/models/user.dart';

import 'package:video_player/video_player.dart';

class StoriesScreen extends StatefulWidget {
  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final stories = ModalRoute.of(context).settings.arguments as List<Story>;
    return Scaffold(
      body: StoryScreen(stories: stories),
    );
  }
}

class StoryScreen extends StatefulWidget {
  final List<Story> stories;

  const StoryScreen({@required this.stories});

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  AnimationController _animController;
  VideoPlayerController _videoController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    final Story firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController.stop();
        _animController.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_currentIndex]);
          } else {
            // Out of bounds - loop story
            // You can also Navigator.of(context).pop() here
            _currentIndex = 0;
            _loadStory(story: widget.stories[_currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Story story = widget.stories[_currentIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.stories.length,
              itemBuilder: (context, i) {
                final Story story = widget.stories[i];
                switch (story.media) {
                  case MediaType.image:
                    return CachedNetworkImage(
                      imageUrl: story.url,
                      fit: BoxFit.cover,
                    );
                  case MediaType.video:
                    if (_videoController != null &&
                        _videoController.value.initialized) {
                      return FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoController.value.size.width,
                          height: _videoController.value.size.height,
                          child: VideoPlayer(_videoController),
                        ),
                      );
                    }
                }
                return const SizedBox.shrink();
              },
            ),
            Positioned(
              top: 40.0,
              left: 10.0,
              right: 10.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: widget.stories
                        .asMap()
                        .map((i, e) {
                          return MapEntry(
                            i,
                            AnimatedBar(
                              animController: _animController,
                              position: i,
                              currentIndex: _currentIndex,
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 1.5,
                      vertical: 15.0,
                    ),
                    child: Row(
                      children: [
                        Hero(
                          tag: story.url,
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                story.user.profileImageUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            story.user.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              bottom: 40,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(
                        width: 280,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Color.fromARGB(
                          100,
                          1,
                          1,
                          1,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5.0,
                          sigmaY: 5.0,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          color: Color.fromARGB(
                            100,
                            1,
                            1,
                            1,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.send, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.stories.length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories[_currentIndex]);
        } else {
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          _currentIndex = 0;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else {
      if (story.media == MediaType.video) {
        if (_videoController.value.isPlaying) {
          _videoController.pause();
          _animController.stop();
        } else {
          _videoController.play();
          _animController.forward();
        }
      }
    }
  }

  void _loadStory({Story story, bool animateToPage = true}) {
    _animController.stop();
    _animController.reset();
    switch (story.media) {
      case MediaType.image:
        _animController.duration = story.duration;
        _animController.forward();
        break;
      case MediaType.video:
        _videoController = null;
        _videoController?.dispose();
        _videoController = VideoPlayerController.network(story.url)
          ..initialize().then((_) {
            setState(() {});
            if (_videoController.value.initialized) {
              _animController.duration = _videoController.value.duration;
              _videoController.play();
              _animController.forward();
            }
          });
        break;
    }
    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    Key key,
    @required this.animController,
    @required this.position,
    @required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return _buildContainer(
                            constraints.maxWidth * animController.value,
                            Colors.white,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}

