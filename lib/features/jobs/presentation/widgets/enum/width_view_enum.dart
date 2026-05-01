enum WidthViewEnum {
  list(width: 160.0),
  grid(width: double.infinity);

  const WidthViewEnum({required this.width});
  final double width;
}
