class CreateJobApplicantParams {
  CreateJobApplicantParams({
    required this.title,
    required this.motivation,
    this.photoUrl,
    this.pdfUrl,
    required this.categories,
    required this.locations,
    required this.genderId,
    required this.typeId,
    required this.durationId,
    required this.status,
  });

  final String title;
  final String motivation;
  final List<int> categories;
  final List<int> locations;
  final String? photoUrl;
  final String? pdfUrl;
  final int genderId;
  final int typeId;
  final int durationId;
  final String status;
}
