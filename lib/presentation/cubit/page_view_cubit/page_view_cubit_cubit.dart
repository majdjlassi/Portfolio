import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/presentation/cubit/page_view_cubit/page_view_cubit_state.dart';

@injectable
class PageViewCubit extends Cubit<PageViewCubitState> {
  PageViewCubit(int initialIndex) : super(PageViewCubitState(initialIndex));

  void onPageChanged(int index) {
    emit(PageViewCubitState(index));
  }
}
