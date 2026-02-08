
// void doSomething() {
//   print('ready to do something');
//   sleep( Duration(seconds: 3));
//   print('ready to start...');

// }

// void main() {
//   print('started thinking...');

//   doSomething();
//   print('doing something...');
//   print('finished thinking.');

// }

// Future<String> getName() async {
//   await Future.delayed(Duration(seconds:1));
//   return 'mg hein';//
// }

// Future<int> getAge() async {
//   await Future.delayed(Duration(seconds: 3));
//   return 25;
// }



// void main() async {
//   final name = await getName();
//   final age = await getAge();

//   print('Let start');
  
//   print(name);
//   print(age);
// }

// class User{
//   Map<String, dynamic> user = {'user': "mgmg"};

//   Future<String> getName() {
//     if(user.containsKey('user')){
//       return Future.value(user['user']);
//     }

//     return _fetchUserName();
//   }

//   Future<String> _fetchUserName() async {
//     await Future.delayed(Duration(seconds: 4));
//     return 'mghein';
//   }
// }


// void main() async {

//   final user = User();
//   final userName = await user.getName();
//   print(userName);
// }

import 'dart:async';



class SmartConnection{

  final Completer<String> _completer = Completer();

  Future<String> get completer => _completer.future;

  SmartConnection() {
    _attempConnection();
  }

  Future<void> _attempConnection() async {
    return await Future.delayed(Duration(seconds: 3), () {
      if(DateTime.now().second % 2 == 0) {
        print('Connected successfully!');
      } else {
        print('Connection failed!');
      }
    });
  }
}

void main() async {
  try {
    final connection =  SmartConnection();
    final result = await connection.completer;
    print(result);
  } catch (e) {
    print('Error: $e'); 
  }
}

