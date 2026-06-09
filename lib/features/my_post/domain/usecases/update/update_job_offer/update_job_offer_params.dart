class UpdateJobOfferParams {
  const UpdateJobOfferParams({
    required this.id,
    required this.title,
    this.imageId,
    required this.description,
    required this.categories,
    required this.location,
    required this.gender,
    required this.actor,
    required this.limitDate,
    required this.status,
  });

  final int id;
  final String title;
  final int? imageId;
  final String description;
  final List<int> categories;
  final int location;
  final int gender;
  final int actor;
  final String limitDate;
  final String status;
}
