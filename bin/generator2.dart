Stream<int> countDownFromAsync(int num) async* {
  while (num > 0) {
    yield num--;
  }
}

void main() {
  print('Getting CountDown Stream [async* + yield]');
  var sequence = countDownFromAsync(5);
  print('Starting...');
  sequence.listen((int value) {
    print(value);
  });
  print('DONE');
}
