import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_pdf.dart';

part 'job_pdf_model.freezed.dart';
part 'job_pdf_model.g.dart';

@freezed
abstract class JobPdfModel with _$JobPdfModel implements JobPdf {
  const factory JobPdfModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(defaultValue: '') required String url,
  }) = _JobPdfModel;

  const JobPdfModel._();

  factory JobPdfModel.fromJson(Map<String, dynamic> json) =>
      _$JobPdfModelFromJson(json);
}
