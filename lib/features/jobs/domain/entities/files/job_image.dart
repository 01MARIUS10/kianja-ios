class JobImage {
  const JobImage({
    required this.id,
    required this.name,
    required this.url,
    required this.urlMin,
  });

  const JobImage.empty({
    this.id = -1,
    this.name = '',
    this.url = '',
    this.urlMin = '',
  });

  final int id;
  final String name;
  final String url;
  final String urlMin;
}
