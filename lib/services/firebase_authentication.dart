import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itelectivesix/models/reg_users.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: camel_case_types
class Firebase_Authentication {
  RegUsers currentUser;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  final CollectionReference regUsers =
      FirebaseFirestore.instance.collection("regusers");

  Firebase_Authentication(
      {FirebaseAuth? auth, GoogleSignIn? googleSignIn, RegUsers? loginUser})
      : _auth = auth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn(),
        currentUser = loginUser ?? RegUsers();

  RegUsers userFromFirebaseUser(User user) {
    return RegUsers(
      uid: user.uid,
      displayName: user.displayName ?? "",
      email: user.email ?? "",
      photoUrl: user.photoURL ?? "",
      display: false,
    );
  }

  Stream<RegUsers> get getUser {
    return _auth.authStateChanges().map((duser) {
      return userFromFirebaseUser(duser!);
    }).handleError((error) {
      return RegUsers();
    });
  }

  RegUsers getCurrentUser(BuildContext context) {
    return userFromFirebaseUser(_auth.currentUser!);
  }

  Future loginWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthhentication =
          await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthhentication.idToken,
        accessToken: googleSignInAuthhentication.accessToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);

      final User? user = result.user;

      RegUsers loginUser = userFromFirebaseUser(user!);

      DocumentSnapshot ds = await regUsers.doc(loginUser.uid).get();
      if (ds.exists) {
        loginUser.display = ds["display"];
      } else {
        await regUsers.doc(loginUser.uid).set({
          "displayname": loginUser.displayName,
          "email": loginUser.email,
          "photourl": loginUser.photoUrl,
          "display": true,
        });
      }
      print("FirebaseAuth " +
          loginUser.display.toString() +
          " " +
          loginUser.displayName);
      this.currentUser = loginUser;

      return loginUser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> logOut(BuildContext context) async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
