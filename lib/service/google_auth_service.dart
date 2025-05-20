import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  GoogleSignInAccount? get currentUser => _googleSignIn.currentUser;

  Stream<GoogleSignInAccount?> get onCurrentUserChanged =>
      _googleSignIn.onCurrentUserChanged;

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // User canceled the sign-in
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      return googleUser;
    } catch (error) {
      print('Error signing in with Google: $error');
      return null;
    }
  }

  Future<void> signOut() => _googleSignIn.signOut();

  Future<bool> isSignedIn() => _googleSignIn.isSignedIn();
}
