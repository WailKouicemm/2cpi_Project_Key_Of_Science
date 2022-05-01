

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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService{
  final _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user){
  if(user==null){
    return null ;
  }
  return User(user.uid , user.email);
  }


Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
}

  Future<User?> SignUpWithEmailPasssword(
      String email,String password
      )async{
    final credencial = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credencial.user);
  }


  Future<User?> SignInWithEmailPasssword(
      String email,String password
      )async{
    final credencial = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credencial.user);
  }

  Future<void> SignOut() async{
  return await _firebaseAuth.signOut();
  }
}


class User{
  final String uid ;
  final String? email ;
  User(  this.uid,this.email);
}





