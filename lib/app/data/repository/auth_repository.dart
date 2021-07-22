import 'package:firebase_auth/firebase_auth.dart';
import 'package:thinky/app/core/response_result.dart';

class AuthRepository {
  late FirebaseAuth _auth = FirebaseAuth.instance;

  bool isSignedIn() {
    print("current user email: ${_auth.currentUser!.email}");
    print("current user is verified: ${_auth.currentUser!.emailVerified}");
    print("current user metadata: ${_auth.currentUser!.metadata}");
    return _auth.currentUser != null;
  }

  Future<ResponseResult> registerUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      return ResponseResult.complete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print(e.message);
        return ResponseResult.error(ResponseException(message: e.message));
      } else if (e.code == 'email-already-in-use') {
        print(e.message);
        return ResponseResult.error(ResponseException(message: e.message));
      } else if (e.code == 'invalid-email') {
        print(e.message);
        return ResponseResult.error(ResponseException(message: e.message));
      } else {
        print(e);
        return ResponseResult.error(ResponseException(message: e.message));
      }
    } catch (e) {
      print(e);
      return ResponseResult.error(
          ResponseException(message: "Something went wrong"));
    }
  }
}
