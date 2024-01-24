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

Future<DocumentSnapshot> getDoc() async {
  final result = await FirebaseFirestore.instance.collection('userDetail').doc(id).get();
  // debugPrint(result.data().toString());
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
                              setState(() {
                                id = snapshot.data!.docs[index].id;
                              });
                              getDoc();
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              color: Colors.pink,
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
              FutureBuilder(
                future: getDoc(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading....');
                  }
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.data().toString());
                  }
                  return const Text('text');
                },
              )
            ],
          ),
        ));
  }
}
