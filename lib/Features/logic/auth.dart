import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/legacy.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

Future<User?> SignUpWithEmail(
  String username,
  String uid,
  String email,
  String password,
) async {
  //get document current numbers of users
  final countersRef = await _firestore.collection('counters').doc('count');
  await _firestore.runTransaction((tx) async {
    final snapshot = await tx.get(countersRef);
    final current = snapshot['value'] as int; //get number of users
    final newDoc =
        'user_${current + 1}'; //set document name by number of users++
    tx.update(countersRef, {
      'value': current + 1,
    }); //update value for number of users
    //create new user
    tx.set(_firestore.collection('users').doc(newDoc), {
      'name': username,
      'uid': uid,
      'email': email,
      'password': password,
      'createAt': FieldValue.serverTimestamp(),
    });
  });
}
