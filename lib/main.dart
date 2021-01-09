import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:new_instagram/screens/postDetailsScreen.dart';
import 'package:new_instagram/screens/storiesScreen.dart';
import 'package:new_instagram/widgets/postItem.dart';
import 'package:new_instagram/widgets/storiesBar.dart';

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
        accentColor: Colors.red,
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
        '/post-details': (ctx) => PostDetailsScreen(),
        '/stories': (ctx) => StoriesScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'New post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          child: StoriesBar(users: DUMMY_USERS),
                          height: constraints.maxHeight * 0.17,
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return PostItem(post: DUMMY_POSTS[index]);
                      },
                      childCount: DUMMY_POSTS.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
