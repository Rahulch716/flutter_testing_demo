class Failure {
  const Failure([this.message = '']);

  final String message;

  @override
  String toString() => message;
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message]);
}

class NullFailure extends Failure {
  const NullFailure([super.message]);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure([super.message]);
}

class DataNotFoundFailure extends Failure {
  const DataNotFoundFailure([super.message]);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message]);
}
