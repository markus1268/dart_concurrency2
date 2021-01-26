Iterable<int> countDownFromSyncRecursive(int num) sync* {
  if (num > 0) {
    yield num;
    yield* countDownFromSyncRecursive(num - 1);
  }
}

void main() {
  print('Getting CountDown Iterable [sync* + yield*]');
  var sequence = countDownFromSyncRecursive(5);
  print('Starting...');
  for (var value in sequence) {
    print(value);
  }
  print('DONE');
}
