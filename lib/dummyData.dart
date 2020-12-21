import 'models/story.dart';
import 'models/post.dart';
import 'models/user.dart';
import 'models/comment.dart';

const User user = User(
  name: 'Lucas',
  profileImageUrl:
      'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
);

const DUMMY_STORIES = [
  Story(
    url:
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    media: MediaType.image,
    duration: const Duration(seconds: 10),
    user: user,
  ),
  Story(
    url: 'https://media.giphy.com/media/moyzrwjUIkdNe/giphy.gif',
    media: MediaType.image,
    user: user,
    duration: const Duration(seconds: 7),
  ),
  Story(
    url:
        'https://static.videezy.com/system/resources/previews/000/005/529/original/Reaviling_Sjusj%C3%B8en_Ski_Senter.mp4',
    media: MediaType.video,
    duration: const Duration(seconds: 0),
    user: user,
  ),
  Story(
    url:
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: user,
  ),
  Story(
    url:
        'https://static.videezy.com/system/resources/previews/000/007/536/original/rockybeach.mp4',
    media: MediaType.video,
    duration: const Duration(seconds: 0),
    user: user,
  ),
  Story(
    url: 'https://media2.giphy.com/media/M8PxVICV5KlezP1pGE/giphy.gif',
    media: MediaType.image,
    duration: const Duration(seconds: 8),
    user: user,
  ),
];

const DUMMY_POSTS = [
  Post(
    user: user,
    id: 1,
    likesAmount: 200,
    commentsAmount: 100,
    image: 'https://www.einerd.com.br/wp-content/uploads/2014/08/sheldon1.jpg',
    comments: [
      Comment(id: 1, content: 'Looking great'),
      Comment(id: 2, content: 'Amazing!'),
      Comment(id: 3, content: 'Love this pic'),
    ],
  ),
  Post(
    user: user,
    id: 2,
    likesAmount: 200,
    commentsAmount: 100,
    image: 'https://www.einerd.com.br/wp-content/uploads/2014/08/sheldon1.jpg',
    comments: [
      Comment(id: 1, content: 'Looking great'),
      Comment(id: 2, content: 'Amazing!'),
      Comment(id: 3, content: 'Love this pic'),
    ],
  ),
  Post(
    user: user,
    id: 3,
    likesAmount: 200,
    commentsAmount: 100,
    image: 'https://www.einerd.com.br/wp-content/uploads/2014/08/sheldon1.jpg',
    comments: [
      Comment(id: 1, content: 'Looking great'),
      Comment(id: 2, content: 'Amazing!'),
      Comment(id: 3, content: 'Love this pic'),
    ],
  ),
  Post(
    user: user,
    id: 4,
    likesAmount: 200,
    commentsAmount: 100,
    image: 'https://www.einerd.com.br/wp-content/uploads/2014/08/sheldon1.jpg',
    comments: [
      Comment(id: 1, content: 'Looking great'),
      Comment(id: 2, content: 'Amazing!'),
      Comment(id: 3, content: 'Love this pic'),
    ],
  ),
  Post(
    user: user,
    id: 5,
    likesAmount: 200,
    commentsAmount: 100,
    image: 'https://www.einerd.com.br/wp-content/uploads/2014/08/sheldon1.jpg',
    comments: [
      Comment(id: 1, content: 'Looking great'),
      Comment(id: 2, content: 'Amazing!'),
      Comment(id: 3, content: 'Love this pic'),
    ],
  ),
];
