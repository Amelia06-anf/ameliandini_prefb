import 'package:amelia_prefb/create.dart';
import 'package:amelia_prefb/ctrl.dart';
import 'package:amelia_prefb/detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreX extends StatefulWidget {
  const FirestoreX({super.key});

  @override
  State<FirestoreX> createState() => _FirestoreXState();
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
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Create()),
                );
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 5,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {});
              },
              child: const Icon(Icons.refresh),
            ),
          ],
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
                          ...List.generate(length, (index) {
                            final id = snapshot.data!.docs[index].id;
                            return Card(
                              child: ListTile(
                                title: Text(
                                  snapshot.data!.docs[index]['nama'],
                                ),
                                subtitle: Text(id),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Detail(id: id)),
                                  );
                                },
                              ),
                            );
                          })
                        ],
                      );

                      // Column(
                      //   children: [
                      //     ...List.generate(
                      //       length,
                      //       (index) => GestureDetector(
                      //         onTap: () {
                      //           // print('halo');
                      //           setState(
                      //             () {
                      //               id = snapshot.data!.docs[index].id;
                      //               // getDoc();
                      //             },
                      //           );
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(builder: (context) => Detail(id: id)),
                      //           );
                      //         },
                      //         child: Container(
                      //           margin: const EdgeInsets.all(5),
                      //           color: id == snapshot.data!.docs[index].id ? Colors.blue : Colors.pink,
                      //           child: Row(
                      //             children: [
                      //               Text("[${snapshot.data!.docs[index].id.toString()}]"),
                      //               const SizedBox(height: 5),
                      //               Text(snapshot.data!.docs[index]['nama'].toString()),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // );
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
