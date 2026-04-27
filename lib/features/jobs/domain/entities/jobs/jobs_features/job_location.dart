class JobLocation {
  const JobLocation({required this.id, required this.name});

  const JobLocation.empty({this.id = -1, this.name = ''});

  final int id;
  final String name;
}
