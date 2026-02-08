

sealed class Result<T>{}

class Success<T> extends Result<T>{
  final T data;

  Success(this.data);
}

class Failed<T> extends Result<T>{
  final String msg;

  Failed(this.msg);
}


Result<int> convertInt(String data) {
  try {
    final result = int.parse(data);
    return Success(result);
  } catch (e) { 
    return Failed('failed...');
  }
}

String getData(Result result) {
  return switch (result) {
    Success(:var data) => 'Success $data',
    Failed(:var msg) => 'Failed $msg'
  };
}

//that return is String...
Result<String> validEmail(String email) {
  if(email.isEmpty) return Failed('msg');

  if(!email.contains('@')) return Failed('$email is not valid');

  return Success('here is your email: $email');
}

void main() {

  var result1 = validEmail('mgmg@gmail.com');
  final message = switch (result1) {
    Success(:var data) => data,
    Failed(:var msg) => msg,
  };
  print(message);

  var result2 = validEmail('mgmggmail.com');
  final message2 = switch (result2) {
    Success(:var data) => data,
    Failed(:var msg) => msg,
  };
  print(message2);

  // var result1 = convertInt('124');
  // final msg1 = getData(result1);
  // print(msg1);


  // var result2 = convertInt('data');
  // final msg2 = getData(result2);
  // print(msg2);

}