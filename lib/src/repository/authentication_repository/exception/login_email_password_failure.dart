class LoginWithEmailAndPasswordFailure {
  final String message;

  const LoginWithEmailAndPasswordFailure(
      {this.message = "Login failed. Check the error status"});

  factory LoginWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'auth/wrong-password':
        return LoginWithEmailAndPasswordFailure(message: 'Incorrect password');
      case 'invalid-email':
        return LoginWithEmailAndPasswordFailure(
            message: 'Invalid or malformed email address');
      case 'user-not-found':
        return LoginWithEmailAndPasswordFailure(message: 'User is not found');
      case 'operation-now-allowed':
        return LoginWithEmailAndPasswordFailure(
            message: 'Failed to perform the action');
      case 'user-disabled':
        return LoginWithEmailAndPasswordFailure(
            message: 'User has been disabled. Contact support');
      default:
        return LoginWithEmailAndPasswordFailure();
    }
  }
}
