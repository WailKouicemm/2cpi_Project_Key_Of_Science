import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Models.dart';

class AuthService {
 static String _username = "-";
    static String get getUsername => _username;

 static Future<void> setUsername(String usernam)async{
   final prefs = await SharedPreferences.getInstance();
   await prefs.setString("usernam",usernam);
   _username=usernam;
 }

 static Future<void> fetchUsername() async{

     final prefs = await SharedPreferences.getInstance();
     String  usernam = await prefs.getString("usernam") ?? "";
     _username=usernam;
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

  static Future<Userr?> SignUpWithEmailPasssword(String email, String password,String username) async {
    // final credencial =
    try{
     final auth.UserCredential res =  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await _sendUsertoFirestore(
      email: email,
      password: password,
      username: username,
      uid: res.user!.uid
    );
    }catch(e){
      throw e;
    }
  }

  static Future<void> SignInWithEmailPasssword(String email, String password) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error){
      throw error;
    }
  }

  static Future<void> SignOut() async {
     await _firebaseAuth.signOut();
  }


 static Future<void> _sendUsertoFirestore({required String email, password, username,uid})async{
  try{
    print("_sendUsertoFirestore called");
     await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({
      'email': email,
      'password': password,
      'username': username
    }).then((value) => print("finished dsfhsdufhsdfsdf"));
  } catch (e){
    print("error rezefjdsifjidfuhcivx $e");
    throw e;}

  }

}
