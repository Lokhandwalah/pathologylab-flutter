import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pathologylab/models/user.dart' as my_user;

abstract class BaseAuth {
  Future googleSignIn();
  Future signOut();
}

class AuthService extends BaseAuth {
  static final _auth = FirebaseAuth.instance;

  bool get isUserLoggedIn => _auth.currentUser != null;

  User get currentUser => _auth.currentUser;

  @override
  Future<my_user.User> googleSignIn() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn()
        .signIn()
        .catchError((error) =>
            throw Exception("Problem with Google Signin: " + error.toString()));
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      final userCredential = await _auth.signInWithCredential(credential);
      final firebaseUser = userCredential.user;
      return my_user.User(
          email: firebaseUser.email, name: firebaseUser.displayName);
    } catch (error) {
      throw Exception("Google Signin Failed: " + error.toString());
    }
  }

  @override
  Future<void> signOut() async => await _auth.signOut();
}
