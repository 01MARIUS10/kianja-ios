class TrainingName {
  const TrainingName({required this.id, required this.name});

  const TrainingName.empty({this.id = -1, this.name = ''});

  final int id;
  final String name;
}
