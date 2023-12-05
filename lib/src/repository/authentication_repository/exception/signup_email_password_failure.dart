class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "Unknown error occured"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure('Password terlalu lemah');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(
            'Email tidak valid atau tidak sah');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure('Email ini sudah digunakan');
      case 'operation-now-allowed':
        return SignUpWithEmailAndPasswordFailure(
            'Gagal melakukan aksi tersebut');
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure(
            'Pengguna telah dinonaktifkan. Hubungi pusat bantuan');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
