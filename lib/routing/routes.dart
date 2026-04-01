enum Routes {
  // ------------- CHOOSE LANG ----------------
  chooseLang('/choose-lang'),
  // ------------- CHOOSE LANG ----------------

  // ------------- HOME (Job offers) ----------------
  jobs('/'),
  // ------------- HOME (Job offers) ----------------

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
