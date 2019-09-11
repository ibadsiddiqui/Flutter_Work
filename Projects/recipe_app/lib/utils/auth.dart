import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<GoogleSignInAccount> getSignedInAccount(
    GoogleSignIn googleSignIn) async {
  // Is the user already signed in?
  GoogleSignInAccount account = googleSignIn.currentUser;
  // Try to sign in the previous user:
  if (account == null) {
    account = await googleSignIn.signInSilently();
  }
  return account;
}

Future<FirebaseUser> signIntoFirebase() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  print("signed in " + user.displayName);
  return user;
}

// Future<FirebaseUser> signIntoFirebase(
//     GoogleSignInAccount googleSignInAccount) async {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   GoogleSignInAuthentication googleAuth =
//       await googleSignInAccount.authentication;
//   return await _auth.(
//       accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
// }
