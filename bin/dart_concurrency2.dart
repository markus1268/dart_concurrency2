import 'dart:async';

void main(List<String> arguments) {
  print('Hello world! ${DateTime.now().toString()}');
  scheduleMicrotask(_test);
  print('End of main');
}

void _test() {
  print('from microtask');
}
