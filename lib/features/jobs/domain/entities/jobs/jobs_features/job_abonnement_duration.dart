class JobAbonnementDuration {
  const JobAbonnementDuration({required this.id, required this.name});

  const JobAbonnementDuration.empty({this.id = -1, this.name = ''});

  final int id;
  final String name;
}
