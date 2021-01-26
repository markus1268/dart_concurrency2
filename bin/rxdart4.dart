import 'package:rxdart/rxdart.dart';

void main() {
  ReplaySubject<int> subject = ReplaySubject<int>();
  subject.stream.listen((x) => print('subject1: $x'));

  subject.add(1);
  subject.add(2);
  subject.add(3);
  subject.stream.listen((x) => print('subject2: $x'));
  subject.add(4);
  subject.add(5);
}
