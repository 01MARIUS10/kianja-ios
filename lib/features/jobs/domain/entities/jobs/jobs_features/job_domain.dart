class JobDomain {
  const JobDomain({required this.id, required this.name, required this.icon});

  const JobDomain.empty({this.id = -1, this.name = '', this.icon = ''});

  final int id;
  final String name;
  final String icon;
}
