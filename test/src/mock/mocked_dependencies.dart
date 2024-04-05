import 'package:integration_test_demo/src/data/source/counter_local_data_source.dart';
import 'package:integration_test_demo/src/domain/repository/counter_repository.dart';
import 'package:integration_test_demo/src/domain/usecase/increment_counter_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterLocalDataSource extends Mock
    implements CounterLocalDataSource {}

class MockCounterRepository extends Mock implements CounterRepository {}

class MockIncrementCounterUseCase extends Mock
    implements IncrementCounterUseCase {}
