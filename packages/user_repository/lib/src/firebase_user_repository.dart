import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/entities/my_user_entity.dart';
import 'package:user_repository/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<MyUser?> get user =>
      _firebaseAuth.authStateChanges().flatMap((firebaseUser) async* {
        if (firebaseUser == null) {
          yield MyUser.empty;
        } else {
          yield await userCollection.doc(firebaseUser.uid).get().then(
                (value) => MyUser.fromEntity(
                  MyUserEntity.fromDocument(value.data()!),
                ),
              );
        }
      });

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password,
      );
      return myUser.copyWith(id: user.user!.uid);
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser myUser) async {
    try {
      await userCollection.doc(myUser.id).set(myUser.toEntity().toDocument());
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
