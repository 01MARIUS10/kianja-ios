class Sponsor {
  const Sponsor({
    required this.title,
    required this.image,
    required this.pageUrl,
  });
  const Sponsor.empty({this.title = '', this.image = '', this.pageUrl = ''});
  final String title;
  final String image;
  final String pageUrl;
}
