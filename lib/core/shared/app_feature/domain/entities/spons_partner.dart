class SponsPartner {
  const SponsPartner({
    required this.title,
    required this.image,
    required this.pageUrl,
  });
  const SponsPartner.empty({
    this.title = '',
    this.image = '',
    this.pageUrl = '',
  });
  final String title;
  final String image;
  final String pageUrl;
}
