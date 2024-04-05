part of 'counter_cubit.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState.initial({required int count}) = _Initial;

  const factory CounterState.failure(
      {required int count, required String message}) = _Failure;
}
