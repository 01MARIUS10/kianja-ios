class ComplaintsSuggestionsParams {
  const ComplaintsSuggestionsParams({
    required this.title,
    required this.description,
    this.imageIds,
  });

  final String title;
  final String description;
  final List<int>? imageIds;
}
