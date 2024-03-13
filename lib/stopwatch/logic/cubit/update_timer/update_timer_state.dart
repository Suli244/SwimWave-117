part of 'update_timer_cubit.dart';

@freezed
class UpdateTimerState with _$UpdateTimerState {
  const factory UpdateTimerState.initial() = _Initial;

  const factory UpdateTimerState.loading() = _LoadingAll;
  const factory UpdateTimerState.error(String error) = _ErrorAll;
  const factory UpdateTimerState.success() = _SuccessAll;
  
  const UpdateTimerState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
