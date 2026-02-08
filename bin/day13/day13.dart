
import 'dart:async';

Stream<String> stream1 = Stream.empty();

Stream<int> stream2 = Stream.value(32);

Stream<int> stream3 = Stream.periodic(Duration(seconds: 1), (data) => data);

void main() async {

  // stream3.listen((data) => print(data));

  // final controller = StreamController<List<int>>();

  // controller.sink.add([1,2,3,4,5]);
  // controller.stream.listen((data) => print(data));  

  // controller.close();

  // final subscription =  stream3.where((val) => val > 5).take(4).listen((data) => print(data));
    
  final subscription = stream3.map((val) => val * 2).take(3)
  .listen((data) => print(data));

   subscription.cancel();

}