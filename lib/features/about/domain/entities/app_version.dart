class AppVersion {
  const AppVersion({required this.version, required this.filename});

  const AppVersion.empty({this.version = '', this.filename = ''});

  final String version;
  final String filename;
}
