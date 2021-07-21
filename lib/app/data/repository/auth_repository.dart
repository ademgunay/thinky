import 'package:firebase_auth/firebase_auth.dart';
import 'package:thinky/app/data/model/response_result.dart';

class AuthRepository {
  late FirebaseAuth _auth = FirebaseAuth.instance;

  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  Future<ResponseResult> registerUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return ResponseResult.complete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return ResponseResult.error(e);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return ResponseResult.error(e);
      } else {
        print(e);
        return ResponseResult.error(e);
      }
    } catch (e) {
      print(e);
      return ResponseResult.error(Exception("Something went wrong"));
    }
  }
}
