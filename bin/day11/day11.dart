import 'day11_extension.dart';
import 'list_extension.dart';

class StringUtils {
  //for check email
  static bool validEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  //check pass
  static bool validPassword(String password) {
    return password.length >= 8 &&
        password.contains(RegExp(r'A-Z')) &&
        password.contains(r'0-9');
  }

  //capitalize first letter
  static String capitalizeFirstLetter(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}

class CurrencyUtils{
  static String formatKyat(String amount) {
    return '$amount kyat';
  }

  static String formatKyatWithComma(int amount) {
    return '${addComma(amount)} kyat with comma';
  }

  //that is helper method for add comma
  //it maybe useful
  static String addComma(int amount) {
    return amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), 
      (Match m) => '${m[1]},',
    );
  }
}

class DateUtils{
  static String formatDateDMY(DateTime date) {
    return '${date.day}-${date.month}-${date.year}';
  }

  static String formatDateMDY(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}

void main(){
  // print(StringUtils.validEmail('mgmg@mail.com'));
  // print(Currency.formatKyatWithComma(200000000000));
  // print(DateUtils.formatDateDMY(DateTime(2021, 3,2)));
  // final String email = 'mgm@gmail.cm';
  // print(email.isValidEmail);
  final amount = 100000000;
  print(amount.formatKyatWithComma);

  final list = [1,2,3,3,4,4,5,5,5];
  print(list.unique);
  final stringList = ['apple', 'banana', 'apple', 'orange'];
  print(stringList.unique);

}
