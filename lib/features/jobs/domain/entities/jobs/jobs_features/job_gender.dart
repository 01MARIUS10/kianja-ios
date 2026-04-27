class JobGender {
  const JobGender({required this.id, required this.name});

  const JobGender.empty({this.id = -1, this.name = ''});

  final int id;
  final String name;
}
