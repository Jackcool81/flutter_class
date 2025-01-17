//Code Provided by https://www.bacancytechnology.com/blog/email-authentication-using-firebase-auth-and-flutter
import 'package:firebase_auth/firebase_auth.dart';


class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  get user => _auth.currentUser;
  get uid => user.uid;




  //creates a new user with email and password
  Future signUp({required String email, required String password}) async {
    //print(uid);
    try {

      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // var actionCodeSettings = {
      //   url: 'https://www.example.com/cart?email=user@example.com&cartId=123',
      //   iOS: {
      //     bundleId: 'com.example.ios'
      //   },
      //   android: {
      //     packageName: 'com.example.android',
      //     installApp: true,
      //     minimumVersion: '12'
      //   },
      //   handleCodeInApp: true
      // };
    //   if (user != null){
    //     print("sent");
    //     user.sendEmailVerification()
    //         .then(() {
    //         // Verification email sent.
    //     })
    //     .catch((error) {
    // // Error occurred. Inspect error.code.
    // });
    // }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

  }

  String getUID() {
    return user.uid;
  }

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // print(uid);
      // print(email);
      // print(password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();

    print('signout');
  }
}