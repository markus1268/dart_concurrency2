import 'dart:isolate';

void mainApp() async {
  var receivePort = ReceivePort();
  await Isolate.spawn(entryPoint, receivePort.sendPort);

  // Receive the SendPort from the Isolate
  SendPort sendPort = await receivePort.first;

  // Send a message to the Isolate
  sendPort.send('hello');
}

// Entry point for your Isolate
entryPoint(SendPort sendPort) async {
  // Open the ReceivePort to listen for incoming messages (optional)
  var port = ReceivePort();

  // Send messages to other Isolates
  sendPort.send(port.sendPort);

  // Listen for messages (optional)
  await for (var data in port) {
    // `data` is the message received.
  }
}
