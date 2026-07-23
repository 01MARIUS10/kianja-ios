class Partner {
  const Partner({
    required this.title,
    required this.image,
    required this.pageUrl,
  });
  const Partner.empty({this.title = '', this.image = '', this.pageUrl = ''});
  final String title;
  final String image;
  final String pageUrl;
}
