class UpdateJobApplicantParams {
  UpdateJobApplicantParams({
    required this.id,
    required this.title,
    required this.motivation,
    this.pdfUrl,
    required this.locationId,
    required this.genderId,
    required this.typeId,
    required this.durationId,
    required this.categoryId,
    required this.status,
  });

  final int id;
  final String title;
  final String motivation;
  final String? pdfUrl;
  final int locationId;
  final int genderId;
  final int typeId;
  final int durationId;
  final int categoryId;
  final String status;
}
