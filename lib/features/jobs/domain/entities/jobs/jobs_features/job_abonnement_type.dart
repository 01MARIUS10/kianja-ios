class JobAbonnementType {
  const JobAbonnementType({required this.id, required this.name});

  const JobAbonnementType.empty({this.id = -1, this.name = ''});

  final int id;
  final String name;
}
