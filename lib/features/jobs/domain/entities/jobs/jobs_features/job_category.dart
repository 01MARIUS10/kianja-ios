class JobCategory {
  const JobCategory({
    required this.id,
    required this.name,
    required this.iconUrl,
  });

  const JobCategory.empty({this.id = -1, this.name = '', this.iconUrl = ''});

  final int id;
  final String name;
  final String iconUrl;
}
