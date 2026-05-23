part of 'about_bloc.dart';

abstract class AboutEvent extends Equatable {
  const AboutEvent();

  @override
  List<Object> get props => [];
}

class AboutGetAllVersionsRequested extends AboutEvent {
  const AboutGetAllVersionsRequested();
}

class AboutGetUpdateVersionRequested extends AboutEvent {
  const AboutGetUpdateVersionRequested();
}
