class TrainingTag {
  const TrainingTag({required this.id, required this.tag});

  const TrainingTag.empty({this.id = -1, this.tag = ''});

  final int id;
  final String tag;
}
