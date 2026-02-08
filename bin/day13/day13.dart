// import 'dart:async';

// Stream<String> stream1 = Stream.empty();

// Stream<int> stream2 = Stream.value(32);

// Stream<int> stream3 = Stream.periodic(Duration(seconds: 1), (data) => data);

// void main() async {

//   // stream3.listen((data) => print(data));

//   // final controller = StreamController<List<int>>();

//   // controller.sink.add([1,2,3,4,5]);
//   // controller.stream.listen((data) => print(data));

//   // controller.close();

//   // final subscription =  stream3.where((val) => val > 5).take(4).listen((data) => print(data));

//   final subscription = stream3.map((val) => val * 2).take(3)
//   .listen((data) => print(data));

//    subscription.cancel();

// }

// void main() async {
//   print("Date time: ${DateTime.now()}");

//   Stream<int> numberCount =
//       Stream.periodic(Duration(seconds: 1), (count) => 10 - count).take(11);

//   final subscription = numberCount.listen((data) => print(data),
//       onDone: () => print("Countdown complete"),
//       onError: (e) => print("Error: $e"));

//   await Future.delayed(Duration(seconds: 12));
//   await subscription.cancel();
// }

import 'dart:async';

class ChatRoom {
  final String username;
  final String message;
  final DateTime time;

  ChatRoom({required this.username, required this.message, required this.time});

  @override
  String toString() {
    return '[$time] $username: $message';
  }
}

class ChatService {
  final controller = StreamController<ChatRoom>();

  Stream<ChatRoom> get messages => controller.stream;

  void sendMessage(String name, String msg) {
    final chat = ChatRoom(username: name, message: msg, time: DateTime.now());
    controller.sink.add(chat);
  }

  void dispose() {
    controller.close();
  }
}

void main() async {
  final chatService = ChatService();

  final subscription = chatService.messages.listen((data) => print(data));

  chatService.sendMessage("Alice", "Hello, everyone!");
  await Future.delayed(Duration(seconds: 1));

  chatService.sendMessage("Bob", "Hi, Alice!");
  await Future.delayed(Duration(seconds: 1));

  chatService.sendMessage("Charlie", "Good to see you both.");
  await Future.delayed(Duration(seconds: 1));

  await subscription.cancel();
  chatService.dispose();
}
