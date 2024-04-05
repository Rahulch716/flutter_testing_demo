import 'package:dartz/dartz.dart';

import '../../core/utils/failure.dart';
import '../repository/counter_repository.dart';

class IncrementCounterUseCase {
  final CounterRepository _counterRepository;

  IncrementCounterUseCase(this._counterRepository);

  Either<Failure, int> call(int count) {
    final res = _counterRepository.incrementCounter(count);
    return res;
  }
}
