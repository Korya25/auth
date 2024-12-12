String handleFirebaseAuthError(String errorCode) {
  switch (errorCode) {
    case 'invalid-email':
    case 'wrong-password':
      return "The email address or password are invalid.";
    case 'user-disabled':
      return "This user account has been disabled. Please contact support.";
    case 'user-not-found':
      return "No user found for this email. Please go to Register now.";
    case 'email-already-in-use':
      return "The email address is already in use. Please use a different email.";
    case 'weak-password':
      return "The password is too weak. Please choose a stronger password.";
    case 'network-request-failed':
      return "Network error. Please check your internet connection and try again.";
    case 'too-many-requests':
      return "Too many attempts. Please try again later.";
    case 'operation-not-allowed':
      return "This operation is not allowed. Please contact support.";
    case 'email-already-in-use':
      return "The email address is already in use. Please use a different email.";
    default:
      return "An unknown error occurred. Please try again.";
  }
}
