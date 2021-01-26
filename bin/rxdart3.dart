import 'package:rxdart/rxdart.dart';

void main() {
  BehaviorSubject<int> subject = BehaviorSubject<int>();
  subject.stream.listen((x) => print('subject1: $x')); // prints 1,2,3
  subject.add(1);
  subject.add(2);
  subject.add(3);

  subject.stream.listen((x) => print('subject2: $x')); // prints 3
}
