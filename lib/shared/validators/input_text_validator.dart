class InputTextValidator {
  String? validateName(String value) {
    return value.isEmpty ? "Name cannot be blank" : null;
  }

  String? validateEmail(String value) {
    return value.isEmpty ? "Email cannot be blank" : null;
  }

  String? validatePassword(String value) {
    return value.isEmpty ? "Password cannot be blank" : null;
  }
}
