import 'models/story.dart';
import 'models/post.dart';
import 'models/user.dart';
import 'models/comment.dart';

const DUMMY_STORIES = [
  Story(
      imageUri:
          'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
      name: 'Lucas'),
  Story(
      imageUri:
          'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
      name: 'Jhon'),
  Story(
      imageUri:
          'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
      name: 'Jhon'),
  Story(
      imageUri:
          'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
      name: 'Jhon'),
  Story(
      imageUri:
          'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
      name: 'Jhon'),
  Story(
      imageUri:
          'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
      name: 'Jhon'),
  Story(
      imageUri:
          'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
      name: 'Jhon'),
  Story(
      imageUri:
          'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
      name: 'Jhon'),
  Story(
      imageUri:
          'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
      name: 'Jhon'),
  Story(
      imageUri:
          'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
      name: 'Jhon'),
  Story(
      imageUri:
          'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
      name: 'Jhon'),
  Story(
      imageUri:
          'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
      name: 'Jhon'),
  Story(
      imageUri:
          'https://avatars3.githubusercontent.com/u/53620720?s=460&u=c50968841654375f462ab48ca342219b6ba48935&v=4',
      name: 'Jhon'),
];

const DUMMY_POSTS = [
  Post(
    user: User(
      name: 'Lucas',
      profileImage:
          'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
    ),
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
    user: User(
      name: 'Lucas',
      profileImage:
          'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
    ),
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
    user: User(
      name: 'Lucas',
      profileImage:
          'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
    ),
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
    user: User(
      name: 'Lucas',
      profileImage:
          'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
    ),
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
    user: User(
      name: 'Lucas',
      profileImage:
          'https://avatars0.githubusercontent.com/u/37252638?s=460&u=13ae26df788cf8f87c47e5b89a30a320cd5c9848&v=4',
    ),
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
