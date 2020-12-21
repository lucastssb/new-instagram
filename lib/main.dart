import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_instagram/screens/storiesScreen.dart';

import './screens/postDetailsScreen.dart';
import './widgets/storiesBar.dart';
import 'widgets/postsList.dart';

import './dummyData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        primaryTextTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: {
        '/post-details' : (ctx) => PostDetailsScreen(),
        '/stories' : (ctx) => StoriesScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final AppBar appBar = AppBar(
      title: SvgPicture.asset(
        'assets/Instagram_logo.svg',
        color: Colors.black,
        width: 100,
      ),
      leading: IconButton(
        icon: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.mail_outline,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      centerTitle: true,
    );
    
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBar,
      body: Column(
        children: [
          Container(
            child: StoriesBar(stories: DUMMY_STORIES),
            height: (mediaQuery.size.height -
                    appBar.preferredSize.height -
                    mediaQuery.padding.top) *
                0.15,
          ),
          Container(
            height: (mediaQuery.size.height -
                    appBar.preferredSize.height -
                    mediaQuery.padding.top) *
                0.85,
           margin: const EdgeInsets.only(left: 5, right: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30),),
              child: PostList(posts: DUMMY_POSTS),
            ),
          ),
        ],
      ),
    );
  }
}
