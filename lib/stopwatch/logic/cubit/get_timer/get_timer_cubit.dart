import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swim_wave_117/stopwatch/logic/model/timer_hive_model.dart';
import 'package:swim_wave_117/stopwatch/logic/repo/timer_repo.dart';

part 'get_timer_cubit.freezed.dart';

class GetTimerCubit extends Cubit<GetTimerState> {
  GetTimerCubit(this.repo) : super(const GetTimerState.loading());
  final TimerRepo repo;

  getAddTimer() async {
    emit(const GetTimerState.loading());
    try {
      final timerList = await repo.getTimer();
      emit(GetTimerState.success(timerList.reversed.toList()));
    } catch (e) {
      emit(GetTimerState.error(e.toString()));
    }
  }
}

@freezed
class GetTimerState with _$GetTimerState {
  const factory GetTimerState.loading() = _Loading;
  const factory GetTimerState.error(String error) = _Error;
  const factory GetTimerState.success(List<TimerHiveModel> model) = _Success;
}
