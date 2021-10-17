import 'dart:isolate';

// The port of the new isolate
// this port will be used to further
// send messages to that isolate
SendPort? newIsolateSendPort;

// Instance of the new Isolate
Isolate? newIsolate;

// Method that launches a new isolate
// and proceeds with the initial
// hand-shaking
Future<void> callerCreateIsolate() async {
  // Local and temporary ReceivePort to retrieve
  // the new isolate's SendPort
  var receivePort = ReceivePort();

  // Instantiate the new isolate
  newIsolate = await Isolate.spawn(
    callbackFunction,
    receivePort.sendPort,
  );

  // Retrieve the port to be used for further
  // communication
  newIsolateSendPort = await receivePort.first;
}

// Method that sends a message to the new isolate
// and receives an answer
// In this example, I consider that the communication
// operates with Strings (sent and received data)
Future<String> sendReceive(String messageToBeSent) async {
  // We create a temporary port to receive the answer
  var port = ReceivePort();

  // We send the message to the Isolate, and also
  // tell the isolate which port to use to provide
  // any answer
  newIsolateSendPort?.send(CrossIsolatesMessage<String>(
    sender: port.sendPort,
    message: messageToBeSent,
  ));

  // Wait for the answer and return it
  var answer = await port.first;
  return answer.toString();
}

// Extension of the callback function to process incoming messages
void callbackFunction(SendPort callerSendPort) {
  // Instantiate a SendPort to receive message
  // from the caller
  var newIsolateReceivePort = ReceivePort();

  // Provide the caller with the reference of THIS isolate's SendPort
  callerSendPort.send(newIsolateReceivePort.sendPort);

  // Isolate main routine that listens to incoming messages,
  // processes it and provides an answer
  newIsolateReceivePort.listen((dynamic message) {
    var incomingMessage = message as CrossIsolatesMessage;

    // Process the message
    var newMessage = 'complemented string ' + incomingMessage.message;

    // Sends the outcome of the processing
    incomingMessage.sender?.send(newMessage);
  });
}

// Helper class
class CrossIsolatesMessage<T> {
  final SendPort? sender;
  final T? message;

  CrossIsolatesMessage({
    this.sender,
    this.message,
  });
}

// Routine to dispose an isolate
void dispose() {
  newIsolate?.kill(priority: Isolate.immediate);
  newIsolate = null;
}

Future<void> main() async {
  await callerCreateIsolate();
  var result = await sendReceive('Hello from main');
  print(result);
  result = await sendReceive('Hello from main 2');
  print(result);
  dispose();
}
