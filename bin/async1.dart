Future<void> hello() async {
  print('Enter hello function...');
  await Future.delayed(Duration(seconds: 3),
      () => print('something exciting is going to happen here...'));
  //await print('Processing hello');
  //print('Processing hello');
  print('Exit hello function...');
}

Future<void> main() async {
  print('Starting ...');
  await hello();
  //hello();
  print('Exit main ...');
}
