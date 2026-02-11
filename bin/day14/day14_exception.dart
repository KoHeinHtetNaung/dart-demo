// import 'dart:io';

// void main() {
//   readConfig();
// }

// Future<String> readConfig() async {
//   try {
//     final read = File('config.json').readAsString();
//     return read;
//   } on FileSystemException catch (e) {
//     print("Read Config error: ${e.message}");
//     return "Error reading config";
//   }
// }

// void main() {

//   print("1. Start...");

//   try {
//     print("2. This is step 2.");
//     test1();
//     print('7. This is step 7.');
//   } catch (error, stackTrace) {
//     print("Error caught in main: $error $stackTrace");
//   } finally {
//     print('8. This is step 8 (finally block).');
//   }

// }

// void test1() {
//   print("3. This is step 3.");
//   test2();
//   print('6. This is step 6.');
// }

// void test2() {
//   print("4. This is step 4.");
//   throw Exception("An error occurred in Test2");
//   print("5. This is step 5.");
// }

// void main() {
//   try {
//     throw NetworkException( "Failed to connect to the server", stausCode: "500", url: "https://example.com/api");
//   } on NetworkException catch (e) {
//     print("Network error: $e");
//   } catch (e) {
//     print("An unexpected error occurred: $e");
//   }
// }

// class AppException implements Exception{
//   final String message;

//   AppException(this.message);

//   @override
//   String toString() => message;
// }

// class NetworkException extends AppException {
//   // final String message;
//   final String? stausCode;
//   final String? url;
//   final DateTime? timestamp;

//   NetworkException(String message,
//       {this.stausCode, this.url}) : timestamp = DateTime.now(), super(message);
// }

sealed class Result<T> {
  Result();
}

class Success<T> extends Result<T> {
  final T data;

  Success(this.data);
}

class Failed<T> extends Result<T> {
  final String message;
  
  Failed(this.message);
}

Result<String> validEmail(String email) {
  if (email.isEmpty) return Failed('Email cannot be empty');
  if (!email.contains('@')) return Failed('$email is not a valid email address');
  return Success('Valid email: $email');
}

String getData(Result result) {
  return switch (result) {
    Success(:var data) => 'Success: $data',
    Failed(:var message) => 'Failed: $message',
  };
}

void main() {
  final result = getData(validEmail('mgmg@gmail.com'));
  print(result);
}

