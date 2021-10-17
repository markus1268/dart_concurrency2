import 'package:bloc/bloc.dart';

Future<void> main() async {
  print('----------CUBIT----------');
  Bloc.observer = SimpleBlocObserver();
  final cubit = CounterCubit();
  final subscription = cubit.stream.listen(print);
  cubit.increment();
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await cubit.close();
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
