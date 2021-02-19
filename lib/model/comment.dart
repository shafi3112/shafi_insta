class Comment {
  String authorName;
  String authorImageUrl;
  String text;

  Comment({
    this.authorName,
    this.authorImageUrl,
    this.text,
  });
}

final List<Comment> comments = [
  Comment(
    authorName: 'Shan',
    authorImageUrl: 'assets/images/shafi3.jpg',
    text: 'Handsome!!',
  ),
  Comment(
    authorName: 'Irfan',
    authorImageUrl: 'assets/images/shafi4.jpg',
    text: 'Such a good pic shafi',
  ),
  Comment(
    authorName: 'shanfaf',
    authorImageUrl: 'assets/images/shafi5.jpg',
    text: 'wohhh shafi, looking good',
  ),
  Comment(
    authorName: 'Sharukh khan',
    authorImageUrl: 'assets/images/shafi2.jpg',
    text: 'accha hai bhai',
  ),
  Comment(
    authorName: 'Shafi',
    authorImageUrl: 'assets/images/shafi1.jpg',
    text: 'Thanks everyone :)',
  ),
];