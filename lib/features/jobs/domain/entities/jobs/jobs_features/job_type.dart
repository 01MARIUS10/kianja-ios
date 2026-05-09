class JobType {
  const JobType({required this.id, required this.name});

  const JobType.empty({this.id = -1, this.name = ''});

  final int id;
  final String name;
}
