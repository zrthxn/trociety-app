import '../models/user.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';



mixin UserModel on Model{
  User _appUser;
  
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser>signIn() async {
    GoogleSignInAccount googleSignInAccount =await googleSignIn.signIn();
    GoogleSignInAuthentication gSA =await googleSignInAccount.authentication;
    
    final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: gSA.accessToken,
    idToken: gSA.idToken,
  );

    FirebaseUser user = await _auth.signInWithCredential(credential);
    
    _appUser=User(email: user.email,);
    
    return user;

  }

  Future<Null> signOut() async {
    await googleSignIn.signOut();

  }

  


} 