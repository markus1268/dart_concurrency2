import 'package:rxdart/rxdart.dart';

void main() {
  PublishSubject<int> subject = PublishSubject<int>();

/*this listener below will print every integer added to the subject: 1, 2, 3, ...*/
  subject.stream.listen((x) => print('subject1: $x'));
  subject.add(1);
  subject.add(2);

/* but this listener below will print only the integer added after his initialization: 3, ...*/
  subject.stream.listen((x) => print('subject2: $x'));
  subject.add(3);
}
