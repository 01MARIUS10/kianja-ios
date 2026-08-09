enum Routes {
  // ------------- LOADING (initial route, hidden under native splash) ------
  loading('/loading'),
  // ------------- LOADING ----------------

  // ------------- CHOOSE LANG ----------------
  chooseLang('/choose-lang'),
  modifyAppLang('modify-app-lang'),
  // ------------- CHOOSE LANG ----------------

  // ------------- ABOUT ----------------
  about('/about'),
  // ------------- ABOUT ----------------

  // ------------- ABOUT ----------------
  photoViewer('/photo-viewer'),
  // ------------- ABOUT ----------------

  viewAdd('/viewAdd'),
  viewUserProfile('/viewUserProfile/:id'),

  // ------------- HOME (Job offers) ----------------
  jobs('/'),
  jobCategoryViewAll('job-category-view-all'),
  jobOfferDetail('job-offer-detail/:id/:matchedLocation'),
  // ------------- HOME (Job offers) ----------------

  // ------------- JOB APPLICANT ----------------
  jobApplicantViewAll('job-applicant-view-all'),
  jobApplicantDetail('job-applicant-detail/:id'),
  jobApplicantViewPdf('job-applicant-view-pdf'),
  // ------------- JOB APPLICANT ----------------

  // ------------- TRAINING CENTER ----------------
  trainingCenterHotEventViewAll('training-center-hot-event-view-all'),
  trainingCenterHotEventDetail('training-center-hot-event-detail/:id'),
  trainingCenterViewAll('training-center-view-all'),
  trainingCenterViewDomain('training-center-view-domain/:id'),
  trainingCenterDetail('training-center-detail/:trainingCenterId'),
  // ------------- TRAINING CENTER ----------------

  // ------------- POST ----------------
  post('/post'),
  postJobApplicant('job-applicant'),
  postJobOffer('job-offer'),
  postTrainingCenter('training-center'),
  postExpertExecutive('expert-executive'),
  postHotEvent('postHotEvent/:trainingCenterId'),
  createHotEvent('createHotEvent/:trainingCenterId'),
  createHotEventSuccessful('createHotEventSuccessfully/:id'),
  subscribeExpertExecutive('subscribe-expert-executive'),
  postExpertExecutiveSuccessful('expert-executive-successfully-posted/:id'),
  postJobOfferSuccessful('job-offer-successfully-posted/:id'),
  postJobApplicantSuccessful('job-applicant-successfully-posted/:id'),
  postTrainingCenterSuccessful('training-center-successfully-posted/:id'),
  appliedJobOfferSuccessful('appliedJobOfferSuccessful'),
  // ------------- POST ----------------

  // ------------- MY POST ----------------
  myPost('/my-post'),
  myPostJobOfferEdit('edit-job-offer/:id'),
  myPostJobApplicantEdit('edit-job-applicant/:id'),
  myPostTrainingCenterEdit('edit-training-center/:id'),
  myPostHotEventEdit('edit-hot-event/:id'),
  candidatesList('candidates-list/:jobId'),
  candidateDetail('candidate-detail/:id'),
  viewCandidatePdf('view-candidate-pdf'),
  prolongerJobApplicant('prolonger-job-applicant/:id'),
  prolongerJobApplicantSuccessful(
    'prolonger-job-applicant-successful/:jobAppId',
  ),
  // ------------- MY POST ----------------

  // ------------- ACCOUNT ----------------
  account('/account'),
  kara('/kara'),
  applications('/applications'),
  personalInfo('personal-info'), // Personal Info
  viewProfileCV('profile-cv'),
  complaintsAndSuggestions(
    'complaints-and-suggestions',
  ), // Complaints and Suggestions
  complaintsAndSuggestionsSent(
    'complaints-and-suggestions-sent',
  ), // Complaints and Suggestions Sent
  blockedUsers('blocked-users'), // Blocked Users
  updatePersonalInfo('edit'), // Update Personal Info
  changePassword('change-password'), // Change Password
  termsOfUse('/termsOfUse'), // Terms of Use
  privacyPolicy('/privacyPolicy'), // Privacy Policy
  // ------------- ACCOUNT ----------------

  // ------------- FAVORITES ----------------
  favorites('/favorites'),
  // ------------- FAVORITES ----------------

  // ------------- AUTH ----------------
  signIn('/sign-in'),
  signUp('/sign-up'),
  // ------------- AUTH ----------------

  // ------------- SAVED ----------------
  saved('/saved');
  // ------------- SAVED ----------------

  const Routes(this.path);
  final String path;
}
