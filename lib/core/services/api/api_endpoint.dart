enum ApiEndpoint {
  // ============= Auth =============
  login(path: '/api/auth/login/'),
  logout(path: '/api/auth/logout/'),
  changePassword(path: '/api/auth/change-password/'),
  register(path: '/api/auth/register/'),
  profilPhoto(path: '/api/profil/photo/'),

  // ============= Users =============
  profile(path: '/api/profil/'),
  karaHistory(path: '/api/kara/historique'),

  // ============= Job offers =============
  jobOffer(path: '/api/job-offers/'),

  // ============= Job applicants =============
  jobApplicant(path: '/api/job-applicants/'),

  // ============= App =============
  complaintsSuggestions(path: '/api/plainteSuggestion'),
  getUpdate(path: '/api/app/getUpdate/'),
  appVersions(path: '/api/app/versions/'),
  cgu(path: '/cgu'),
  privacy(path: '/privacy'),
  blockedUsers(path: '/api/profil/blocked'),

  // ============= Training center =============
  trainingCenter(path: '/api/training-centers/');

  const ApiEndpoint({required this.path});
  final String path;
}
