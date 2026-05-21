class CreateTrainingCenterParams {
  const CreateTrainingCenterParams({
    required this.name,
    required this.description,
    required this.actorId,
    required this.locationId,
    required this.typeId,
    required this.tagId,
    required this.durationId,
    required this.status,
  });
  final String name;
  final String description;
  final int actorId;
  final int locationId;
  final int typeId;
  final int tagId;
  final int durationId;
  final String status;
}
