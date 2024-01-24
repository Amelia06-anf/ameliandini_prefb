import 'package:amelia_prefb/detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreX extends StatefulWidget {
  const FirestoreX({super.key});

  @override
  State<FirestoreX> createState() => _FirestoreXState();
}

Future<QuerySnapshot> getColl() async {
  final result = await FirebaseFirestore.instance.collection('username').get();
  return result;
}

var id = '';

class _FirestoreXState extends State<FirestoreX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Data'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: getColl(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final length = snapshot.data!.docs.length;
                      return Column(
                        children: [
                          ...List.generate(
                            length,
                            (index) => GestureDetector(
                              onTap: () {
                                // print('halo');
                                setState(
                                  () {
                                    id = snapshot.data!.docs[index].id;
                                    // getDoc();
                                  },
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Detail(id: id)),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                color: id == snapshot.data!.docs[index].id ? Colors.blue : Colors.pink,
                                child: Row(
                                  children: [
                                    Text("[${snapshot.data!.docs[index].id.toString()}]"),
                                    const SizedBox(height: 5),
                                    Text(snapshot.data!.docs[index]['nama'].toString()),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                    return const Text('text');
                  },
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Load More'),
                ),
              ],
            ),
          ),
        ));
  }
}
