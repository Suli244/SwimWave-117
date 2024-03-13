import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swim_wave_117/stopwatch/logic/repo/timer_repo.dart';

part 'delete_timer_state.dart';
part 'delete_timer_cubit.freezed.dart';

class DeleteTimerCubit extends Cubit<DeleteTimerState> {
  DeleteTimerCubit(this.repo) : super(const DeleteTimerState.initial());

  final TimerRepo repo;

  delete(int id) async {
    emit(const DeleteTimerState.loading());
    try {
      await repo.deleteTimer(id);
      emit(const DeleteTimerState.success());
    } catch (e) {
      emit(DeleteTimerState.error(e.toString()));
    }
  }
}
