import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uptodo/models/log.dart';
import 'package:uptodo/models/user.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final userCurrent = FirebaseAuth.instance.currentUser;

  bool isProcessing = false;

  Future<String> signUpWithUsername(UserModel user) async {
    isProcessing = true;

    try {
      final email = "${user.username}@uptodo.com";
      final password = user.password;
      UserCredential usercred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = usercred.user!.uid;
      await _db.collection('user').doc(uid).set(user.toMap());

      await _db
          .collection('logs')
          .add(
            Log(
              username: user.username,
              action: 'register',
              status: 'success',

              time: user.createdAt,
            ).toMap(),
          );
      return 'success';
    } on FirebaseAuthException catch (e) {
      await _db
          .collection('logs')
          .add(
            Log(
              username: user.username,
              action: 'register',
              status: "faille compte exist: ${e.code}",
              time: user.createdAt,
            ).toMap(),
          );

      return "${e.message}";
    } finally {
      isProcessing = false;
    }
  }

  Future<String> signInWithUsername(UserModel user) async {
    if (isProcessing) return "processing";
    isProcessing = true;
    try {
      final email = "${user.username}@uptodo.com";
      final password = user.password;
      final uid = FirebaseAuth.instance.currentUser?.uid;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await _db.collection('user').doc(uid).update({
        'lastLogin': user.lastLogin,
      });
      await _db
          .collection('logs')
          .add(
            Log(
              username: user.username,
              action: 'login',
              status: 'success',
              time: user.lastLogin,
            ).toMap(),
          );
      return "success";
    } on FirebaseAuthException catch (e) {
      await _db
          .collection('logs')
          .add(
            Log(
              username: user.username,
              action: 'login',
              status: "failled ${e.code}",
              time: user.lastLogin,
            ).toMap(),
          );
      return "${e.message}";
    } finally {
      isProcessing = false;
    }
  }
}
