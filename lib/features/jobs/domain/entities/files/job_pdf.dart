class JobPdf {
  const JobPdf({required this.id, required this.name, required this.url});

  const JobPdf.empty({this.id = -1, this.name = '', this.url = ''});

  final int id;
  final String name;
  final String url;
}
