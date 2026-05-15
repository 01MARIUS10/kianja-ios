import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';

class TrainingCenterFilter {
  const TrainingCenterFilter({
    required this.query,
    required this.name,
    required this.trainingCenters,
  });

  const TrainingCenterFilter.empty({
    this.query = '',
    this.name = '',
    this.trainingCenters = const [],
  });

  final String query;
  final String name;
  final List<TrainingCenter> trainingCenters;
}
