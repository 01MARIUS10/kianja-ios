class JobCategory {
  const JobCategory({required this.id, required this.name});

  const JobCategory.empty({this.id = -1, this.name = ''});

  final int id;
  final String name;
}
