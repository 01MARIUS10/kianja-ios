class UpdateExpertExecutiveParams {
  const UpdateExpertExecutiveParams({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.biography,
    required this.domainId,
    required this.cvPdfId,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String email;
  final String phoneNumber;
  final String address;
  final String biography;
  final int domainId;
  final int cvPdfId;
}
