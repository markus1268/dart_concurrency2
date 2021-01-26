Stream<int> countDownFromAsyncRecursive(int num) async* {
  if (num > 0) {
    yield num;
    yield* countDownFromAsyncRecursive(num - 1);
  }
}

void main() {
  print('Getting CountDown Stream [async* + yield*]');
  var sequence = countDownFromAsyncRecursive(5);
  print('Starting...');
  sequence.listen((int value) {
    print(value);
  });
  print('DONE');
}
