enum Routes {
  // ------------- LOADING (initial route, hidden under native splash) ------
  loading('/loading'),
  // ------------- LOADING ----------------

  // ------------- CHOOSE LANG ----------------
  chooseLang('/choose-lang'),
  // ------------- CHOOSE LANG ----------------

  // ------------- HOME (Job offers) ----------------
  jobs('/'),
  jobCategoryViewAll('job-category-view-all'),
  jobOfferDetail('job-offer-detail'),
  postJobApplicant('post-job-applicant'),
  postJobOffer('post-job-offer'),
  postTrainingCenter('post-training-center'),
  postExpertExecutive('post-expert-executive'),
  // ------------- HOME (Job offers) ----------------

  // ------------- POST ----------------
  post('/post'),
  // ------------- POST ----------------

  // ------------- MY POST ----------------
  myPost('/my-post'),
  // ------------- MY POST ----------------

  // ------------- ACCOUNT ----------------
  account('/account'),
  personalInfo('personal-info'), // Personal Info
  updatePersonalInfo('edit'), // Update Personal Info
  changePassword('change-password'), // Change Password
  // ------------- ACCOUNT ----------------

  // ------------- AUTH ----------------
  signIn('/sign-in'),
  signUp('/sign-up');
  // ------------- AUTH ----------------

  const Routes(this.path);
  final String path;
}
