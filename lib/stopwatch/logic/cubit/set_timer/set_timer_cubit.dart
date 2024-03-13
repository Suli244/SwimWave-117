import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swim_wave_117/stopwatch/logic/model/timer_hive_model.dart';
import 'package:swim_wave_117/stopwatch/logic/repo/timer_repo.dart';

part 'set_timer_cubit.freezed.dart';

class SetTimerCubit extends Cubit<SetTimerState> {
  SetTimerCubit(this.timerRepo) : super(const SetTimerState.initial());
  final TimerRepo timerRepo;

  setAddTimer(TimerHiveModel timerHiveModel) async {
    emit(const SetTimerState.loading());
    try {
      await timerRepo.setTimer(timerHiveModel);
      emit(const SetTimerState.success());
    } catch (e) {
      emit(SetTimerState.error(e.toString()));
    }
  }
}

@freezed
class SetTimerState with _$SetTimerState {
  const factory SetTimerState.initial() = _Initial;
  const factory SetTimerState.loading() = _Loading;
  const factory SetTimerState.error(String error) = _Error;
  const factory SetTimerState.success() = _Success;

  const SetTimerState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
