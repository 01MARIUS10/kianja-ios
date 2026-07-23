import 'package:kianja/features/jobs/presentation/widgets/enum/save_content_enum.dart';

class SaveContentMapper {
  static SaveContentEnum fromString(String? type) {
    switch (type) {
      case 'job-offers':
        return SaveContentEnum.jobOffers;
      case 'job-applicants':
        return SaveContentEnum.jobApplicants;
      case 'training-centers':
        return SaveContentEnum.trainingCenters;
      case 'hots':
        return SaveContentEnum.hots;
      default:
        return SaveContentEnum.events;
    }
  }

  static String toJson(SaveContentEnum type) {
    switch (type) {
      case SaveContentEnum.jobOffers:
        return 'job-offers';
      case SaveContentEnum.jobApplicants:
        return 'job-applicants';
      case SaveContentEnum.trainingCenters:
        return 'training-centers';
      case SaveContentEnum.hots:
        return 'hots';
      case SaveContentEnum.events:
        return 'events';
    }
  }
}
