import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soko_aerial_interns_app/services/auth_service.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService;

  UserRepository({FirebaseAuth? firebaseAuth, required AuthService authService})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _authService = authService;

  Future<User?> signInWithCredentials(
      String email, String password) async {
    print('Attempting to sign in with email: $email');
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Sign in successful for user: ${userCredential.user?.uid}');
      return userCredential.user;
    } catch (e) {
      print('Sign in failed with error: $e');
      rethrow;
    }
  }

  Future<User?> signInWithGoogle() async {
    return _authService.signInWithGoogle();
  }

  Future<void> signOut() async {
    await Future.wait(
      [
        _firebaseAuth.signOut(),
        _authService.signOut(),
      ],
    );
  }

  Future<User?> signUp(String email, String username, String password) async {
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
      throw _mapFirebaseAuthException(e);
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<String?> getUsername(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return doc['username'];
      }
      return null;
    } catch (e) {
      print('Error fetching username: $e');
      return null;
    }
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
