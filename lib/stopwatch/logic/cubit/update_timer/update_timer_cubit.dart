import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swim_wave_117/stopwatch/logic/repo/timer_repo.dart';

part 'update_timer_state.dart';
part 'update_timer_cubit.freezed.dart';

class UpdateTimerCubit extends Cubit<UpdateTimerState> {
  UpdateTimerCubit(this.repo) : super(const UpdateTimerState.initial());


  final TimerRepo repo;

  updateTimerAll(int id, int time) async {
    emit(const UpdateTimerState.loading());
    try {
      await repo.updateTimer(id, time);
      emit(const UpdateTimerState.success());
    } catch (e) {
      emit(UpdateTimerState.error(e.toString()));
    }
  }
}
