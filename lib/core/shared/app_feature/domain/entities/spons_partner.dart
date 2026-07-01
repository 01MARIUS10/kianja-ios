class SponsPartner {
  const SponsPartner({
    required this.title,
    required this.imageUrl,
    required this.pageUrl,
  });
  const SponsPartner.empty({
    this.title = '',
    this.imageUrl = const [],
    this.pageUrl = '',
  });
  final String title;
  final List<String> imageUrl;
  final String pageUrl;
}
