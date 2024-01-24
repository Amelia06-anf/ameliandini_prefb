import 'package:amelia_prefb/ctrl.dart';
import 'package:amelia_prefb/detailmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:amelia_prefb/firestorex.dart';

class Detail extends StatelessWidget {
  const Detail({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detail',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 141, 127, 106),
        ),
        body: FutureBuilder(
          future: getDoc(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Loading....');
            }
            if (snapshot.hasData) {
              final x = snapshot.data!.data()! as Map<String, dynamic>;
              final data = DetailModel.fromMap(x);
              return Column(
                children: [
                  // Text(snapshot.data!['nama'].toString()),
                  // Text(snapshot.data!['alamat'].toString()),
                  // Text(snapshot.data!['umur'].toString()),
                  // Text(snapshot.data!['hobi'].toString()),
                  Text(data.nama),
                  Text(data.umur.toString()),
                  Text(data.hobi),
                  Text(data.alamat),
                ],
              );
            }
            return const Text('text');
          },
        ));
  }
}
