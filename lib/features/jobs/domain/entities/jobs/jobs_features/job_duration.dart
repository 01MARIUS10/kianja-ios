class JobDuration {
  const JobDuration({required this.id, required this.duration});

  const JobDuration.empty({this.id = -1, this.duration = ''});

  final int id;
  final String duration;
}
