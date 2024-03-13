part of 'delete_timer_cubit.dart';

@freezed
class DeleteTimerState with _$DeleteTimerState {
  const factory DeleteTimerState.initial() = _Initial;
  const factory DeleteTimerState.loading() = _Loading;
  const factory DeleteTimerState.error(String error) = _Error;
  const factory DeleteTimerState.success() = _Success;

  const DeleteTimerState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
