class UpdateJobOfferParams {
  const UpdateJobOfferParams({
    required this.id,
    required this.title,
    this.imageId,
    this.imageIds,
    required this.description,
    required this.categories,
    required this.locations,
    // required this.location,
    required this.gender,
    required this.actor,
    required this.showPostButton,
    required this.limitDate,
    required this.status,
  });

  final int id;
  final String title;
  final int? imageId;
  final List<int>? imageIds;
  final String description;
  final List<int> categories;
  final List<int> locations;
  // final int location;
  final int gender;
  final int actor;
  final bool showPostButton;
  final String limitDate;
  final String status;
}
