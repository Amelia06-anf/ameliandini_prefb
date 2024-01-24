// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amelia_prefb/ctrl.dart';
import 'package:amelia_prefb/data.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: ctrl1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ctrl2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('CLEAR'),
                onPressed: () {
                  ctrl1.clear();
                  ctrl2.clear();
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: Text(
                  isloading ? 'Loading...' : 'SUBMIT',
                ),
                onPressed: () async {
                  final x = ctrl1.text;
                  final y = int.parse(ctrl2.text);
                  final data = {'nama': x, 'umur': y};
                  setState(() {
                    isloading = true;
                  });
                  await create(data);
                  setState(() {
                    isloading = false;
                  });
                  ctrl1.clear();
                  ctrl2.clear();
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
