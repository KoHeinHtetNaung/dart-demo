extension StringExtensions on String {
  bool get isValidEmail {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }

  bool get strongPassword {
    return length >= 8 && contains(RegExp(r'A-Z')) && contains(r'0-9');
  }

  //that for elli
  String truncate(int maxLenght) {
    if (length <= maxLenght) return this;
    return '${substring(0, maxLenght)}...';
  }
}

extension IntExtension on int {
  String get formatKyats {
    return '$this kyat';
  }

  String get formatKyatWithComma {
    return addComma(this);
  }

  String addComma(int amount) {
    return amount.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }
}

class CurrencyUtils {
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

void main() {
  final email = 'mgmg@gmail.com';
  print(email.isValidEmail);
}
