import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future create(Map<String, dynamic> data) async {
  final id = UniqueKey().toString();
  final nama = data['nama'];
  await FirebaseFirestore.instance.collection('username').doc(id).set({'nama': nama});
  await FirebaseFirestore.instance.collection('userDetail').doc(id).set(data);
}

Future<DocumentSnapshot> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('userDetail').doc(id).get();
  return result;
}

Future<QuerySnapshot> getColl() async {
  final result = await FirebaseFirestore.instance.collection('username').get();
  return result;
}
