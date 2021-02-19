class message {
  String authorName;
  String authorImageUrl;
  String text;

  message({
    this.authorName,
    this.authorImageUrl,
    this.text,
  });
}

final List<message> messages = [
  message(
    authorName: 'Shan',
    authorImageUrl: 'assets/images/post1.jpg',
    text: 'Hey',
  ),
  message(
    authorName: 'Irfan',
    authorImageUrl: 'assets/images/shafi4.jpg',
    text: 'Broiiii there',
  ),
  message(
    authorName: 'shanfaf',
    authorImageUrl: 'assets/images/shafi5.jpg',
    text: 'Are you free tommorrow',
  ),
  message(
    authorName: 'Sharukh khan',
    authorImageUrl: 'assets/images/shafi2.jpg',
    text: 'Hey Love',
  ),
  message(
    authorName: 'Shafi',
    authorImageUrl: 'assets/images/shafi3.jpg',
    text: 'Happy weekend',
  ),
];