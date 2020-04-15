class StatefulCounterManager {
  int _counter = 0;

  int increment() {
    _counter += 1;
    return _counter;
  }
}
