class JobDomain {
  const JobDomain({required this.id, required this.name});

  const JobDomain.empty({this.id = -1, this.name = ''});

  final int id;
  final String name;
}
