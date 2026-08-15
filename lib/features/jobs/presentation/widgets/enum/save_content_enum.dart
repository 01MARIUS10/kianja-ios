enum SaveContentEnum {
  jobOffers('job-offers'),
  jobApplicants('job-applicants'),
  trainingCenters('training-centers'),
  hots('training-centers/hots'),
  events('training-centers/events');

  const SaveContentEnum(this.type);
  final String type;
}
