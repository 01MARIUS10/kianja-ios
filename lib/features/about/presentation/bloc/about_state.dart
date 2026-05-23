part of 'about_bloc.dart';

abstract class AboutState extends Equatable {
  const AboutState();

  @override
  List<Object> get props => [];
}

class AboutInitial extends AboutState {}

class AboutRequestInProgress extends AboutState {}

class AboutGetAllVersionsSuccess extends AboutState {
  const AboutGetAllVersionsSuccess({required this.appVersions});
  final List<AppVersion> appVersions;

  @override
  List<Object> get props => [appVersions];
}

class AboutGetUpdateVersionSuccess extends AboutState {
  const AboutGetUpdateVersionSuccess({required this.appVersion});
  final AppVersion appVersion;

  @override
  List<Object> get props => [appVersion];
}

class AboutRequestFailure extends AboutState {
  const AboutRequestFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
