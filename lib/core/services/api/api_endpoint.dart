enum ApiEndpoint {
  // ============= Auth =============
  login(path: '/api/auth/login/'),
  logout(path: '/api/auth/logout/'),
  changePassword(path: '/api/auth/change-password/'),
  register(path: '/api/auth/register/'),

  // ============= Users =============
  profile(path: '/api/profil/'),
  karaHistory(path: '/api/kara/historique/'),

  // ============= Job offers =============
  jobOffer(path: '/api/job-offers/'),

  // ============= Job applicants =============
  jobApplicant(path: '/api/job-applicants/'),

  // ============= App =============
  getUpdate(path: '/api/app/getUpdate/'),
  appVersions(path: '/api/app/versions/'),
  cgu(path: '/cgu'),

  // ============= Training center =============
  trainingCenter(path: '/api/training-centers/');

  const ApiEndpoint({required this.path});
  final String path;
}
