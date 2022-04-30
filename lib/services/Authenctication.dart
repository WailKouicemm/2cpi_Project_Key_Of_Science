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
//    });
// }