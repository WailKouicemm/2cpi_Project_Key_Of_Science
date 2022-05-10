import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {
  static final _firebaseAuth = auth.FirebaseAuth.instance;
  static final _instance =  FirebaseFirestore.instance.collection('users');

 static Future<void> _setUsername(String usernam)async{
   print("_setUsername $usernam");
   final prefs = await SharedPreferences.getInstance();

   await prefs.setString("usernam",usernam);
 }

 static Future<String> fetchUsername() async{
   String  username;
   final prefs = await SharedPreferences.getInstance();
   username = await prefs.getString("usernam") ?? "***";
   return username;
 }

 static Future<void> _removeUsername() async{
   final prefs = await SharedPreferences.getInstance();
   await prefs.remove("usernam");
 }




  static Future<void> SignUpWithEmailPasssword(String email, String password,String username) async {
    try{
     final auth.UserCredential res =  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    // await _setUsername(username);
     await _firebaseAuth.currentUser!.updateDisplayName(username);
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
     await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     // _getUsernameFromFirebase(email);
    } catch (error){
      print("SignInWithEmailPasssword error $error");
      throw error;
    }
  }

  static Future<void> SignOut() async {
     await _firebaseAuth.signOut();
     await _removeUsername();
  }

 static Future<void> _sendUsertoFirestore({required String email, password, username,uid})async{
  try{
    await _instance
        .doc(uid)
        .set({
      'email': email,
      'password': password,
      'username': username,
      "uid" : uid
    });
  } catch (e){
    print("error in  _sendUsertoFirestore$e");
    throw e;}
  }

  static Future<void> getUsernameFromFirebase(String email)async{
   try{
     final res  =  await _instance.where("email",isEqualTo: email).get();
    await _setUsername(res.docs[0]["username"]);
   }catch (e){
     throw e;
   }
  }

  static Future<String> getUsername(String uid)async{
    final _instance =  FirebaseFirestore.instance.collection('users');
    final res = await  _instance.where("uid",isEqualTo: uid).get();
    return res.docs[0]["username"];
  }

  static Future<String> getUserImage(String uid)async{
    final _instance =  FirebaseFirestore.instance.collection('users');
    final res = await  _instance.where("uid",isEqualTo: uid).get();
    return res.docs[0]["image"];
  }


}

