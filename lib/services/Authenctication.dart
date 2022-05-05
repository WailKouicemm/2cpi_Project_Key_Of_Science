import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {
  static String _username = "***";

 static Future<void> _setUsername(String usernam)async{
   _username=usernam;
   final prefs = await SharedPreferences.getInstance();
   await prefs.setString("usernam",usernam);
 }

 static Future<String> fetchUsername() async{
   final prefs = await SharedPreferences.getInstance();
   String  username = await prefs.getString("usernam") ?? "-";
   return username;
 }

 static Future<void> _removeUsername() async{
   final prefs = await SharedPreferences.getInstance();
   await prefs.remove("usernam");
 }

  static final _firebaseAuth = auth.FirebaseAuth.instance;



  static Future<void> SignUpWithEmailPasssword(String email, String password,String username) async {
    // final credencial =
    try{
      await _setUsername(username);
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
     await AuthService._getUsernameFromFirebase(email);
     await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error){
      throw error;
    }
  }

  static Future<void> SignOut() async {
     await _firebaseAuth.signOut();
     await _removeUsername();
  }

 static final _instance =  FirebaseFirestore.instance.collection('users');
 static Future<void> _sendUsertoFirestore({required String email, password, username,uid})async{
  try{
    print("_sendUsertoFirestore called");
    await _instance
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

  static Future<void> _getUsernameFromFirebase(String email)async{
   try{
     final res  =  await _instance.where("email",isEqualTo: email).get();
     _setUsername(res.docs[0]["username"]);
   }catch (e){
     throw e;
   }
  }

}

