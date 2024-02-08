// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:e_commerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

abstract class UserRemoteDataSource {
  Future<Unit> signIn(UserModel userModel);

  Future<Unit> signUp(UserModel userModel);

  Future<Unit> signOut();
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  UserRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<Unit> signIn(UserEntity user) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return Future.value(unit);
    } on FirebaseAuthException catch (e) {
      print('------> ${e.code}');
      if (e.code == 'user-not-found') {
        throw UserNotFoundExecption();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Unit> signUp(UserEntity user) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // adding user as auth
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      // adding user to the Cloud Firestore
      await users.add({
        'name' : user.name,
        'email': user.email,
        'password': user.password,
        'userId': FirebaseAuth.instance.currentUser!.uid,
      });
      return Future.value(unit);
    } on FirebaseAuthException catch (e) {
      print('-------------------------------> ${e.code}');
      if (e.code == 'weak-password') {
        throw WeakPasswordExeption();
      } else if (e.code == 'email-already-in-use') {
        throw EmailInUseExeption();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Unit> signOut() async {
    try {
      await firebaseAuth.signOut();
      return Future.value(unit);
    } catch (e) {
      throw ServerException();
    }
  }
}
