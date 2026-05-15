import 'package:kianja/features/jobs/domain/entities/training/training_name.dart';

class HotEvent {
  const HotEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.imageUrl,
    this.trainingName,
  });

  const HotEvent.empty({
    this.id = -1,
    this.title = '',
    this.description = '',
    this.startDate = '',
    this.endDate = '',
    this.type = '',
    this.imageUrl = '',
    this.trainingName,
  });

  final int id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String type;
  final String imageUrl;
  final TrainingName? trainingName;
}
