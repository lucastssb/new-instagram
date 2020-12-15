import 'package:flutter/material.dart';

import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_instagram/models/historyIcon.dart';
import './widgets/storiesBar.dart';
import './models/post.dart';
import './models/user.dart';
import 'widgets/postsList.dart';

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
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<HistoryIcon> historyIcons = [
    HistoryIcon(
        imageUri:
            'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
        name: 'Lucas'),
    HistoryIcon(
        imageUri:
            'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
        name: 'Jhon'),
    HistoryIcon(
        imageUri:
            'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
        name: 'Jhon'),
    HistoryIcon(
        imageUri:
            'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
        name: 'Jhon'),
    HistoryIcon(
        imageUri:
            'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
        name: 'Jhon'),
    HistoryIcon(
        imageUri:
            'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
        name: 'Jhon'),
    HistoryIcon(
        imageUri:
            'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
        name: 'Jhon'),
    HistoryIcon(
        imageUri:
            'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
        name: 'Jhon'),
    HistoryIcon(
        imageUri:
            'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
        name: 'Jhon'),
    HistoryIcon(
        imageUri:
            'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
        name: 'Jhon'),
    HistoryIcon(
        imageUri:
            'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
        name: 'Jhon'),
    HistoryIcon(
        imageUri:
            'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
        name: 'Jhon'),
    HistoryIcon(
        imageUri:
            'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
        name: 'Jhon'),
  ];

  final List<Post> posts = [
    Post(
        user: User(
          name: 'Lucas',
          profileImage:
              'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
        ),
        id: 1,
        likesAmount: 200,
        commentsAmount: 100,
        image:
            'https://www.einerd.com.br/wp-content/uploads/2014/08/sheldon1.jpg'),
    Post(
        user: User(
          name: 'Lucas',
          profileImage:
              'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
        ),
        id: 2,
        likesAmount: 200,
        commentsAmount: 100,
        image:
            'https://www.einerd.com.br/wp-content/uploads/2014/08/sheldon1.jpg'),
    Post(
        user: User(
          name: 'Lucas',
          profileImage:
              'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
        ),
        id: 3,
        likesAmount: 200,
        commentsAmount: 100,
        image:
            'https://www.einerd.com.br/wp-content/uploads/2014/08/sheldon1.jpg'),
    Post(
        user: User(
          name: 'Lucas',
          profileImage:
              'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
        ),
        id: 4,
        likesAmount: 200,
        commentsAmount: 100,
        image:
            'https://www.einerd.com.br/wp-content/uploads/2014/08/sheldon1.jpg'),
    Post(
        user: User(
          name: 'Lucas',
          profileImage:
              'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
        ),
        id: 5,
        likesAmount: 200,
        commentsAmount: 100,
        image:
            'https://www.einerd.com.br/wp-content/uploads/2014/08/sheldon1.jpg'),
  ];
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: SvgPicture.asset(
        'assets/Instagram_logo.svg',
        color: Colors.black,
        width: 100,
      ),
      leading: Icon(
        Icons.settings,
        color: Colors.black,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(
            Icons.mail_outline,
            color: Colors.black,
          ),
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
          StoriesBar(historyIcons: widget.historyIcons),
          Container(
            height: 557,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: PostList(posts: widget.posts),
          ),
        ],
      ),
    );
  }
}
