import 'package:dartz/dartz.dart';
import 'package:integration_test_demo/src/core/utils/failure.dart';

import '../../domain/repository/counter_repository.dart';
import '../source/counter_local_data_source.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource _counterLocalDataSource;

  CounterRepositoryImpl(this._counterLocalDataSource);

  @override
  Either<Failure, int> incrementCounter(int count) {
    try {
      var data = _counterLocalDataSource.incrementCounter(count);
      return Right(data);
    } on Exception {
      return const Left(DatabaseFailure('Something went wrong'));
    }
  }
}
