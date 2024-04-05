class CounterLocalDataSource {
  int incrementCounter(int count) {
    try {
      count += 1;
      return count;
    } catch (e) {
      throw Exception(e);
    }
  }
}
