import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';

class TrainingCenterHotEvent {
  const TrainingCenterHotEvent({
    required this.query,
    required this.name,
    required this.hotEvents,
  });

  const TrainingCenterHotEvent.empty({
    this.query = '',
    this.name = '',
    this.hotEvents = const [],
  });

  final String query;
  final String name;
  final List<HotEvent> hotEvents;
}
