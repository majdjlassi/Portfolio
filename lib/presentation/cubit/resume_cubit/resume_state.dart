import 'package:background_downloader/background_downloader.dart';

sealed class ResumeState {}

class ResumeInitialState extends ResumeState {}

class ResumeDownloadLoadingState extends ResumeState {}

class ResumeDownloadFailedState extends ResumeState {}

class ResumeDownloadedState extends ResumeState {
  final Task task;

  ResumeDownloadedState(this.task);
}
