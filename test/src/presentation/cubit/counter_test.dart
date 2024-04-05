import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_demo/src/data/repository/counter_repository_impl.dart';
import 'package:integration_test_demo/src/data/source/counter_local_data_source.dart';
import 'package:integration_test_demo/src/domain/repository/counter_repository.dart';
import 'package:integration_test_demo/src/domain/usecase/increment_counter_usecase.dart';
import 'package:integration_test_demo/src/presentation/cubit/counter_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mocked_dependencies.dart';

void main() {
  late IncrementCounterUseCase usecase;
  late CounterRepository repository;
  late CounterLocalDataSource dataSource;
  late CounterCubit counterCubit;

  setUp(() {
    dataSource = MockCounterLocalDataSource();
    repository = CounterRepositoryImpl(dataSource);
    usecase = IncrementCounterUseCase(repository);
    counterCubit = CounterCubit(usecase);
  });

  blocTest('should call the [.incrementCounter]',
      build: () => counterCubit,
      setUp: () {
        when(() => dataSource.incrementCounter(0)).thenReturn(1);
      },
      act: (cubit) => cubit.incrementCounter(0),
      expect: () => [const CounterState.initial(count: 1)],
      verify: (cubit) {
        verify(() => dataSource.incrementCounter(0)).called(1);
      });
  blocTest('should throw exception',
      build: () => counterCubit,
      setUp: () {
        when(() => dataSource.incrementCounter(0)).thenThrow(Exception());
      },
      act: (cubit) => cubit.incrementCounter(0),
      expect: () => [
            const CounterState.failure(
                count: 0, message: "Something went wrong")
          ],
      verify: (cubit) {
        verify(() => dataSource.incrementCounter(0)).called(1);
      });
}
