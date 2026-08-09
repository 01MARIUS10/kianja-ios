class CreateTrainingCenterParams {
  const CreateTrainingCenterParams({
    required this.name,
    required this.description,
    this.imageIds,
    required this.domainId,
    required this.locationId,
    required this.typeId,
    // required this.tagId,
    required this.durationId,
    required this.status,
  });
  final String name;
  final String description;
  final List<int>? imageIds;
  final int domainId;
  final int locationId;
  final int typeId;
  // final int tagId;
  final int durationId;
  final String status;
}
