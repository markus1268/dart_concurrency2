Iterable<int> countDownFromSync(int num) sync* {
  while (num > 0) {
    yield num--;
  }
}

void main() {
  print('Getting CountDown Iterable [sync* + yield]');
  var sequence = countDownFromSync(5);
  print('Starting...');
  for (var value in sequence) {
    print(value);
  }
  print('DONE');
}
