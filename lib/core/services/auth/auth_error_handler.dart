String handleLoginError(String errorCode) {
  switch (errorCode) {
    case 'invalid-email':
    case 'wrong-password':
    case 'user-not-found':
      return "Invalid email or password";
    case 'user-disabled':
    case 'operation-not-allowed':
      return "disabled account contact support";
    case 'network-request-failed':
      return "Network error";
    case 'too-many-requests':
    case 'requires-recent-login':
      return "Please try again later";
    default:
      return "Please try again";
  }
}

String handleRegisterError(String errorCode) {
  switch (errorCode) {
    case 'invalid-email':
      return "Invalid email or password";
    case 'email-already-in-use':
      return "Email already exists";
    case 'weak-password':
      return "password is weak";
    case 'operation-not-allowed':
      return "disabled account contact support";
    case 'network-request-failed':
      return "Network error";
    case 'too-many-requests':
      return "Please try again later.";
    case 'credential-already-in-use':
      return "Try another credential ";
    case 'invalid-credential':
      return "Please try again.";
    default:
      return "Please try again.";
  }
}
/*

String handleLoginError(String errorCode) {
  switch (errorCode) {
    case 'invalid-email':
      return "The email address entered is invalid. Please enter a valid email.";
    case 'user-not-found':
      return "No account found with this email. Please register first.";
    case 'wrong-password':
      return "The password is incorrect. Please try again or reset your password.";
    case 'user-disabled':
      return "This account has been disabled. Please contact support for assistance.";
    case 'network-request-failed':
      return "Network error. Please check your internet connection and try again.";
    case 'too-many-requests':
      return "Too many login attempts. Please try again later.";
    case 'requires-recent-login':
      return "This action requires recent login. Please log in again.";
    case 'operation-not-allowed':
      return "Login via email and password is not enabled. Contact support.";
    default:
      return "An unknown error occurred during login. Please try again.";
  }
}

String handleRegisterError(String errorCode) {
  switch (errorCode) {
    case 'invalid-email':
      return "The email address entered is invalid. Please enter a valid email.";
    case 'email-already-in-use':
      return "This email is already registered. Please use a different email or log in.";
    case 'weak-password':
      return "The password is too weak. Please choose a stronger password.";
    case 'operation-not-allowed':
      return "Registration using email and password is not enabled. Contact support.";
    case 'network-request-failed':
      return "Network error. Please check your internet connection and try again.";
    case 'too-many-requests':
      return "Too many attempts to register. Please try again later.";
    case 'credential-already-in-use':
      return "This credential is already associated with another account.";
    case 'invalid-credential':
      return "The provided credential is invalid. Please check and try again.";
    default:
      return "An unknown error occurred during registration. Please try again.";
  }
}


*/
