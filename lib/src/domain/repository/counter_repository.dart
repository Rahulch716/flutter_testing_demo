import 'package:dartz/dartz.dart';

import '../../core/utils/failure.dart';

abstract class CounterRepository {
  Either<Failure, int> incrementCounter(int count);
}
