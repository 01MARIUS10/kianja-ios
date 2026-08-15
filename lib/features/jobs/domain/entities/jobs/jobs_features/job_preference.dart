class JobPreference {
  const JobPreference({required this.showPostButton});
  const JobPreference.empty({this.showPostButton = false});

  final bool showPostButton;
}
