class CreateJobApplicantParams {
  CreateJobApplicantParams({
    required this.title,
    required this.motivation,
    required this.imageUrl,
    required this.pdfUrl,
    required this.locationId,
    required this.genderId,
    required this.typeId,
    required this.durationId,
    required this.categoryId,
    required this.status,
  });

  final String title;
  final String motivation;
  final String imageUrl;
  final String pdfUrl;
  final int locationId;
  final int genderId;
  final int typeId;
  final int durationId;
  final int categoryId;
  final String status;
}
