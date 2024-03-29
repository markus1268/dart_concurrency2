import 'dart:async';

// Prints: "1", "4", "2", and "3".
void main() {
  print('1');
  getInFuture2().then(print);
  Future(() {
    print('3a');
  });
  scheduleMicrotask(_test);
  getInFuture2a().then((value) => print(value));
  getInFuture3().then(print);
  //scheduleMicrotask(_test);
  print('4');
}

Future<String> getInFuture2() => Future.value('2');

Future<String> getInFuture2a() => Future.value('2a');

Future<String> getInFuture3() =>
    Future.delayed(Duration(seconds: 1), () => '3');

void _test() {
  print('from microtask');
}
