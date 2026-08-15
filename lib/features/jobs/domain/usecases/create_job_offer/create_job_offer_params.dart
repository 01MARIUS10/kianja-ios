class CreateJobOfferParams {
  const CreateJobOfferParams({
    required this.title,
    this.imageId,
    this.imageIds,
    required this.description,
    required this.categories,
    required this.locations,
    required this.gender,
    required this.actor,
    required this.showPostButton,
    required this.limitDate,
    required this.status,
  });

  final String title;
  final int? imageId;
  final List<int>? imageIds;
  final String description;
  final List<int> categories;
  final List<int> locations;
  final int gender;
  final int actor;
  final bool showPostButton;
  final String limitDate;
  final String status;
}
