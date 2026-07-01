class UpdateHotEventParams {
  UpdateHotEventParams({
    required this.id,
    required this.trainingCenterId,
    required this.type,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.imageId,
  });

  final int id;
  final int trainingCenterId;
  final String type;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final int? imageId;
}
