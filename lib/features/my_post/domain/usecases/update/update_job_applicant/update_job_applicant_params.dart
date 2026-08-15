class UpdateJobApplicantParams {
  UpdateJobApplicantParams({
    required this.id,
    required this.title,
    required this.motivation,
    this.photoUrl,
    this.pdfUrl,
    required this.categories,
    required this.locations,
    // required this.locationId,
    required this.genderId,
    // required this.typeId,
    // required this.durationId,
    // required this.categoryId,
    required this.status,
  });

  final int id;
  final String title;
  final String motivation;
  final List<int> categories;
  final List<int> locations;
  final String? photoUrl;
  final String? pdfUrl;
  // final int locationId;
  final int genderId;
  // final int typeId;
  // final int durationId;
  // final int categoryId;
  final String status;
}
