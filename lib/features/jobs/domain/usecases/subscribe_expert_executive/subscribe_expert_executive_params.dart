class SubscribeExpertExecutiveParams {
  const SubscribeExpertExecutiveParams({
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
