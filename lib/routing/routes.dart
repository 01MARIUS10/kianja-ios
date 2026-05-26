enum Routes {
  // ------------- LOADING (initial route, hidden under native splash) ------
  loading('/loading'),
  // ------------- LOADING ----------------

  // ------------- CHOOSE LANG ----------------
  chooseLang('/choose-lang'),
  // ------------- CHOOSE LANG ----------------

  // ------------- ABOUT ----------------
  about('/about'),
  // ------------- ABOUT ----------------

  // ------------- ABOUT ----------------
  photoViewer('/photo-viewer'),
  // ------------- ABOUT ----------------

  // ------------- HOME (Job offers) ----------------
  jobs('/'),
  jobCategoryViewAll('job-category-view-all'),
  jobOfferDetail('job-offer-detail/:id'),
  // ------------- HOME (Job offers) ----------------

  // ------------- JOB APPLICANT ----------------
  jobApplicantViewAll('job-applicant-view-all'),
  jobApplicantDetail('job-applicant-detail/:id'),
  // ------------- JOB APPLICANT ----------------

  // ------------- TRAINING CENTER ----------------
  trainingCenterHotEventViewAll('training-center-hot-event-view-all'),
  trainingCenterHotEventDetail('training-center-hot-event-detail'),
  trainingCenterViewAll('training-center-view-all'),
  trainingCenterViewCategory('training-center-view-category/:id'),
  trainingCenterDetail('training-center-detail/:id'),
  // ------------- TRAINING CENTER ----------------

  // ------------- POST ----------------
  post('/post'),
  postJobApplicant('job-applicant'),
  postJobOffer('job-offer'),
  postTrainingCenter('training-center'),
  postExpertExecutive('expert-executive'),
  subscribeExpertExecutive('subscribe-expert-executive'),
  postExpertExecutiveSuccessful('expert-executive-successfully-posted/:id'),
  postJobOfferSuccessful('job-offer-successfully-posted/:id'),
  postJobApplicantSuccessful('job-applicant-successfully-posted/:id'),
  postTrainingCenterSuccessful('training-center-successfully-posted/:id'),
  // ------------- POST ----------------

  // ------------- MY POST ----------------
  myPost('/my-post'),
  myPostJobOfferEdit('edit-job-offer/:id'),
  // ------------- MY POST ----------------

  // ------------- ACCOUNT ----------------
  account('/account'),
  kara('/kara'),
  personalInfo('personal-info'), // Personal Info
  updatePersonalInfo('edit'), // Update Personal Info
  changePassword('change-password'), // Change Password
  termsOfUse('termsOfUse'), // Terms of Use
  // ------------- ACCOUNT ----------------

  // ------------- AUTH ----------------
  signIn('/sign-in'),
  signUp('/sign-up');
  // ------------- AUTH ----------------

  const Routes(this.path);
  final String path;
}
