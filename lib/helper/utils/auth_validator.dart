class AuthValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePasswordRegister(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    // Regular expression to check for special characters (@, #, etc.)
    RegExp specialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!specialChars.hasMatch(value)) {
      return 'Password must contain at least one special character (@, #, etc.)';
    }

    // Regular expression to check for uppercase letters
    RegExp upperChars = RegExp(r'[A-Z]');
    if (!upperChars.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    // Regular expression to check for numbers
    RegExp hasNum = RegExp(r'[0-9]');
    if (!hasNum.hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    return null;
  }

  static String? validatePasswordLogin(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Password cannot be empty';
    }

    return null;
  }
}
