enum Routes {
  chooseLang('/choose-lang'),
  jobs('/'),
  myPost('/my-post'),
  account('/account'),
  personalInfo('/account/personal-info'),
  changePassword('/account/change-password'),
  signIn('/sign-in'),
  signUp('/sign-up');

  const Routes(this.path);
  final String path;
}
