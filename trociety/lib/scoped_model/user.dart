import '../models/user.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



mixin UserModel on Model{
  User _appUser;
  
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount>signIn() async {
    GoogleSignInAccount googleSignInAccount =await googleSignIn.signIn();
    return googleSignInAccount;

  }

  Future<Null> signOut() async {
    await googleSignIn.signOut();

  }

  


} 