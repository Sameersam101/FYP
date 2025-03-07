import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Email & Password Sign In
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      // Sign in with email and password
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user; // Return the signed-in user
    } catch (e) {
      print('Error during sign in: $e');
      return null; // Return null if there's an error
    }
  }

  // Email & Password Sign Up
  Future<User?> signUpWithEmailPassword(
      String email,
      String password,
      String name,
      String mobile,
      String businessName,
      ) async {
    try {
      // Create user with email and password
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save additional user data to Firestore
      await FirebaseFirestore.instance
          .collection('User')
          .doc(result.user!.uid)
          .set({
        'Name': name,
        'Email': email,
        'Mobile': mobile,
        'Businessname': businessName,
        'UserID': result.user!.uid,
      });

      return result.user; // Return the created user
    } catch (e) {
      print('Error during sign up: $e');
      return null; // Return null if there's an error
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}