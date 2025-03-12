import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
 
  String? passwordErrorText;
  User? _user;
  User? get user => _user;

  bool _textButtonLoading = false;
  bool get textButtonLoading => _textButtonLoading;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthProvider() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  // Sign in method
  Future<void> signInWithEmailAndPassword(
    BuildContext context,
      String email, String password) async {
        print("started oooooo");
    setTextButtonLoading(true);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
       passwordErrorText = null;
      Navigator.pop(context);
      if(Navigator.canPop(context)){
        Navigator.pop(context);
      }
      notifyListeners(); // Notify listeners about the new auth state
      setTextButtonLoading(false);
      
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      setTextButtonLoading(false);
     passwordErrorText = _handleLoginException(e);
     notifyListeners(); 
     
    }
  }

  // Set loading state
  void setTextButtonLoading(bool value) {
    _textButtonLoading = value;
    notifyListeners();
  }

  // Automatically handle auth state changes
  void _onAuthStateChanged(User? firebaseUser) {
    _user = firebaseUser;
    notifyListeners();
  }

  // Check if user is authenticated
  bool isAuthenticated() {
    return _user != null;
  }
String? _handleLoginException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid. Please enter a valid email.';
      case 'user-disabled':
        return 'The user corresponding to the given email has been disabled.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled. Please contact support.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.'; // Handle wrong password error
      case 'user-not-found':
        return 'No user found with this email. Please register if you don\'t have an account.'; // Handle user not found error
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'invalid-credential':
        return 'Email or Password incorrect.'; // Invalid credential error
      case 'email-already-in-use':
        return 'email already in use.';
      case 'user-token-expired':
        return 'User token has expired. Please sign in again.'; // This is relevant for tokens but worth including.
      default:
        return 'An unknown error occurred. Please try again later.'; // Handle any other unspecified errors
    }
  }



  // Sign out method
 signOut(BuildContext context) async {
    await _auth.signOut();
  
    _user = null;
      Navigator.pop(context);
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    notifyListeners(); // Notify listeners about the new auth state
  }

}
