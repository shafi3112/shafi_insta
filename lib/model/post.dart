class Post {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;

  Post({
    this.authorName,
    this.authorImageUrl,
    this.timeAgo,
    this.imageUrl,
  });
}

final List<Post> posts = [
  Post(
    authorName: 'Shafi Parpunja',
    authorImageUrl: 'assets/images/shafi1.jpg',
    timeAgo: '32 min',
    imageUrl: 'assets/images/post1.jpg',
  ),
  Post(
    authorName: 'Shafi Parpunja',
    authorImageUrl: 'assets/images/shafi2.jpg',
    timeAgo: '59 min',
    imageUrl: 'assets/images/post2.jpg',
  ),
];

final List<String> stories = [
  'assets/images/shafi2.jpg',
  'assets/images/shafi3.jpg',
  'assets/images/shafi4.jpg',
  'assets/images/shafi5.jpg',
  'assets/images/shafi1.jpg',
  'assets/images/shafi2.jpg',
  'assets/images/shafi3.jpg',
  'assets/images/shafi4.jpg',
];