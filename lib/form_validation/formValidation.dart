// lib/validators.dart

class Validators {
  static String? validateinputFields(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter required field";
    }
    return null;
  }

  // You can add other validators here
  // static String? validateEmail(String? value) { ... }
  // static String? validatePassword(String? value) { ... }
}
