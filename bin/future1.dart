import 'dart:async';

// Prints: "1", "4", "2", and "3".
void main() {
  print('1');
  getInFuture2().then(print);
  getInFuture3().then(print);
  print('4');
}

Future<String> getInFuture2() => Future.value('2');

Future<String> getInFuture3() =>
    Future.delayed(Duration(seconds: 1), () => '3');
