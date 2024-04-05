import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:integration_test_demo/src/domain/usecase/increment_counter_usecase.dart';

part 'counter_cubit.freezed.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this._incrementCounterUseCase)
      : super(const CounterState.initial(count: 0));
  final IncrementCounterUseCase _incrementCounterUseCase;

  incrementCounter(int count) {
    var result = _incrementCounterUseCase(count);
    result.fold(
        (l) => emit(CounterState.failure(count: count, message: l.toString())),
        (r) => emit(CounterState.initial(count: r)));
  }
}
