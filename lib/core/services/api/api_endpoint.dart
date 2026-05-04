enum ApiEndpoint {
  // ============= Auth =============
  login(path: '/api/auth/login/'),
  logout(path: '/api/auth/logout/'),
  changePassword(path: '/api/auth/change-password/'),
  register(path: '/api/auth/register/'),

  // ============= Users =============
  profile(path: '/api/profil/'),
  profileFakaHistorique(path: '/api/profil/faka/historique/'),

  // ============= Job offers =============
  jobOffer(path: '/api/job-offers/'),

  // ============= Job applicants =============
  jobApplicant(path: '/api/job-applicants/'),

  // ============= Training center =============
  trainingCenter(path: '/api/training-centers/');

  const ApiEndpoint({required this.path});
  final String path;
}
