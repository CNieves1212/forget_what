import 'package:firebase_auth/firebase_auth.dart';
import 'package:forget_what/models/custom_user.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // create user obj from firebase user
  // used to only grab uid and nothing else
  CustomUser _userFromFirebaseUser(User user) {
    if(user != null) {
      return CustomUser(uid: user.uid);
    }
  }

  // checks status of logged in or not
  Stream<CustomUser> get user {
    return _firebaseAuth.authStateChanges()
          .map((User user)=> _userFromFirebaseUser(user));
  }

  // Sign In
  Future signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign Up
  Future signUpWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign Out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } 
    catch(e) {
      print(e.toString());
      return null;
    }
  }


  // // looks for whether user is signed in or not
  // Stream<String> get authStateChanges => _firebaseAuth.authStateChanges().map(
  //   (User user) => user?.uid,
  // );

  // // Sign Up
  // Future<String> createUser(String email, String password) async {
  //   final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  //   return currentUser.user.uid;
  // }

  // // Sign In
  //   Future<String> signIn(String email, String password) async {
  //     return (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user.uid;
  //   }

  // // Sign Out 
  //   signOut() {
  //     return _firebaseAuth.signOut();
  //   } 
}