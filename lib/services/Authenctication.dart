import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../models/Models.dart';

class AuthService{
  final _firebaseAuth = auth.FirebaseAuth.instance;

  userr? _userFromFirebase(auth.User? user){
  if(user==null){
     return null;
  }
   return userr(user.uid, user.email);
  }


Stream<userr?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
}

  Future<userr?> SignUpWithEmailPasssword(
      String email,String password
      )async{
    final credencial = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credencial.user);
  }


  Future<userr?> SignInWithEmailPasssword(
      String email,String password
      )async{
    final credencial = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credencial.user);
  }

  Future<void> SignOut() async{
  return await _firebaseAuth.signOut();
  }
}






