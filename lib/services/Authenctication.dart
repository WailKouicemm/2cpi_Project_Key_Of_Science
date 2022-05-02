//
//
//  void signIn() async{
//    final _auth = FirebaseAuth.instance;
//    final   UserCredential res;
//      await _auth
//     .signInWithEmailAndPassword(
//     email: _emailtxt.trim(),
//     password: _paswordtxt)
// }
//
// void signUp()async{
//   ///sign up
//   res = await _auth.createUserWithEmailAndPassword(
//       email: _emailtxt.trim(),
//       password: _paswordtxt);
//
//   await FirebaseFirestore.instance
//       .collection('users')
//       .doc(res.user!.uid)
//       .set({
//     'email': _emailtxt,
//     'PassWord': _paswordtxt,
//     'UserName': _usrname
//   });
// }

import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../models/Models.dart';

class AuthService {
 static String username = "";
 static void setUsername(String usernam){
   username=usernam;
 }

  static final _firebaseAuth = auth.FirebaseAuth.instance;

 static Userr? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return Userr(user.uid, user.email);
  }

  static Stream<Userr?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  static Future<Userr?> SignUpWithEmailPasssword(String email, String password) async {
    // final credencial =
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      throw e;
    }
   // return _userFromFirebase(credencial.user);
  }

  static Future<Userr?> SignInWithEmailPasssword(String email, String password) async {
    final credencial = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(credencial.user);
  }

  static Future<void> SignOut() async {
     await _firebaseAuth.signOut();
  }


}
