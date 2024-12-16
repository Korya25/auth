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

  static String? validateUsername(String? value) {
    // التحقق من إذا كانت القيمة فارغة
    if (value == null || value.isEmpty) {
      return 'User cannot be empty';
    }

    // التحقق من الطول الأدنى
    if (value.length < 3) {
      return 'User must be at least 3 characters long';
    }

    // التحقق من الطول الأقصى
    if (value.length > 20) {
      return 'User must be at most 20 characters long';
    }

    // التحقق من إذا كانت تحتوي على أحرف خاصة
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'User can only contain letters, numbers, and underscores';
    }

    // التحقق من إذا كانت تبدأ بحرف
    if (!RegExp(r'^[a-zA-Z]').hasMatch(value)) {
      return 'User must start with a letter';
    }

    // التحقق من إذا كانت تحتوي على رقم
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'User must contain at least one number';
    }

    return null; // القيمة صالحة
  }
}
