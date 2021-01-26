Stream<int> count(int countTo) async* {
  for (var i = 1; i <= countTo; i++) {
    yield i;
    await Future.delayed(const Duration(seconds: 1));
  }
}

void main() {
  count(10).listen((int value) {
    print(value);
  });
}
