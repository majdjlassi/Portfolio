import 'package:background_downloader/background_downloader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:open_filex/open_filex.dart';
import 'package:portfolio/data/providers/local/local_database.dart';
import 'package:portfolio/presentation/cubit/resume_cubit/resume_state.dart';
import 'package:portfolio/utils/logger.dart';

@lazySingleton
class ResumeCubit extends Cubit<ResumeState> {
  final FileDownloader _fileDownloader;
  final LocalDatabase _localDatabase;

  ResumeCubit(this._fileDownloader, this._localDatabase)
      : super(ResumeDownloadLoadingState());

  void checkResumeAvailibity() async {
    emit(ResumeDownloadLoadingState());
    final taskId = await _localDatabase.getTaskId();
    if (taskId == null) {
      emit(ResumeInitialState());
    } else {
      final taskRecord = await _fileDownloader.database.recordForId(taskId);
      logd('ResumeCubit', 'checkResumeAvailibity', taskRecord.toString());
      if (taskRecord == null) {
        emit(ResumeInitialState());
      } else if (taskRecord.status == TaskStatus.complete) {
        emit(ResumeDownloadedState(taskRecord.task));
      } else {
        emit(ResumeInitialState());
      }
    }
  }

  void downloadResume(String resumeUrl) async {
    emit(ResumeDownloadLoadingState());
    await _fileDownloader.trackTasks();
    final task = await DownloadTask(
            url: resumeUrl, baseDirectory: BaseDirectory.applicationDocuments)
        .withSuggestedFilename(); // define your task
    final result = await _fileDownloader.download(
      task,
      onStatus: (status) {
        if (status == TaskStatus.failed) {
          emit(ResumeDownloadFailedState());
        }
      },
    );
    emit(ResumeDownloadedState(result.task));
    await _localDatabase.saveTaskId(result.task.taskId);
  }

  void openResume() async {
    final filePath = await (state as ResumeDownloadedState).task.filePath();
    OpenFilex.open(filePath);
  }
}
