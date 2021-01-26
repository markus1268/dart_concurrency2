import 'dart:async';

class NumberCreator {
  NumberCreator() {
    Timer.periodic(Duration(seconds: 1), (t) {
      _controller.sink.add(_count);
      _count++;
    });
  }

  var _count = 1;
  final _controller = StreamController<int>();
  Stream<int> get stream => _controller.stream;
}

void main() {
  final myStream = NumberCreator().stream;

  final subscription =
      myStream.where((i) => i % 2 == 0).map((i) => 'String $i').listen(
            (data) {
              print('Data: $data');
            },
            onError: (err) {
              print('Error!');
            },
            cancelOnError: false,
            onDone: () {
              print('Done!');
            },
          );
}
