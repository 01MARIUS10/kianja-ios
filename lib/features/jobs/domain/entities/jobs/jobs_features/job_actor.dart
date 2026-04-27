class JobActor {
  const JobActor({required this.id, required this.name});

  const JobActor.empty({this.id = -1, this.name = ''});

  final int id;
  final String name;
}
