// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import '../models/customuser.dart';
import 'database.dart';

class AuthService {
  // object to use the class functions
  final FirebaseAuth _firebaseinstance = FirebaseAuth.instance;

  // sign in anonymously method
  Future signInAnonymously() async {
    try {
      UserCredential resultofsignin =
          await _firebaseinstance.signInAnonymously();
      User? userDetails = resultofsignin.user;
      print(userDetails);
      CustomUser? customUser = _createCustomUser(userDetails);
      return customUser;
    } catch (e) {
      print(e.toString());
    }
  }

  // create user object based on firebase user
  CustomUser? _createCustomUser(User? user) {
    return user != null
        ? CustomUser(
            uid: user.uid,
            name: 'anonymous',
          )
        : null;
  }

  // the auth user stream
  Stream<CustomUser?> get userStream {
    return _firebaseinstance.authStateChanges().map(_createCustomUser);
  }

  // register user with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String name, int rollNo) async {
    try {
      UserCredential resultOfRegister = await _firebaseinstance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? userDetails = resultOfRegister.user;

      // create a new entry in firebase database for the user
      await DB(uid: userDetails?.uid).updateUserData(
        email: email,
        name: name,
        rollNo: rollNo.toString(),
      );

      return _createCustomUser(userDetails);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  String getUserId() {
    return _firebaseinstance.currentUser!.uid;
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential resultOfSignIn = await _firebaseinstance
          .signInWithEmailAndPassword(email: email, password: password);
      User? userDetails = resultOfSignIn.user;
      return _createCustomUser(userDetails);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out method
  Future signOut() async {
    try {
      return await _firebaseinstance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
