import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService;

  UserRepository({FirebaseAuth? firebaseAuth, required AuthService authService})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _authService = authService;

  Future<User?> signInWithCredentials(String email, String password, BuildContext context) async {
    print('Attempting to sign in with email: $email');
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Sign in successful for user: ${userCredential.user?.uid}');
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Sign in failed with error: $e');
      _showErrorDialog(context, 'Sign in failed', e.message ?? 'An unknown error occurred.');
      rethrow;
    } catch (e) {
      print('Sign in failed with error: $e');
      _showErrorDialog(context, 'Sign in failed', e.toString());
      rethrow;
    }
  }

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      return _authService.signInWithGoogle();
    } catch (e) {
      _showErrorDialog(context, 'Google Sign-In failed', e.toString());
      rethrow;
    }
  }

   Future<void> signOut() async {
    await Future.wait(
      [
        _firebaseAuth.signOut(),
        _authService.signOut(),
      ],
    );
  }

  Future<User?> signUp(String email, String username, String password, BuildContext context) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'username': username,
          'email': email,
        });
      }

      return user;
    } on FirebaseAuthException catch (e) {
      _showErrorDialog(context, 'Sign up failed', _mapFirebaseAuthException(e));
      throw _mapFirebaseAuthException(e);
    } catch (e) {
      _showErrorDialog(context, 'An unexpected error occurred', e.toString());
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<String?> getUsername(String uid, BuildContext context) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return doc['username'];
      }
      return null;
    } catch (e) {
      _showErrorDialog(context, 'Error fetching username', e.toString());
      print('Error fetching username: $e');
      return null;
    }
  }

  void _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              // ignore: prefer_const_constructors
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String _mapFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';
      case 'weak-password':
        return 'The password is too weak.';
      default:
        return 'An unknown error occurred: ${e.code} - ${e.message}';
    }
  }

  Stream<User?> get user => _firebaseAuth.authStateChanges();

  User? get currentUser => _firebaseAuth.currentUser;
}
