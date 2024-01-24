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
          title: const Text(
            'Create',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 141, 127, 106),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                controller: ctrl1,
                decoration: const InputDecoration(
                  labelText: 'Username', // Teks subjudul untuk username
                  labelStyle: TextStyle(color: Colors.brown), // Warna teks subjudul
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                controller: ctrl2,
                decoration: const InputDecoration(
                  labelText: 'Umur', // Teks subjudul untuk umur
                  labelStyle: TextStyle(color: Colors.brown), // Warna teks subjudul
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                controller: ctrl3,
                decoration: const InputDecoration(
                  labelText: 'Alamat', // Teks subjudul untuk alamat
                  labelStyle: TextStyle(color: Colors.brown), // Warna teks subjudul
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                controller: ctrl4,
                decoration: const InputDecoration(
                  labelText: 'Hobi', // Teks subjudul untuk hobi
                  labelStyle: TextStyle(color: Colors.brown), // Warna teks subjudul
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text(
                  'CLEAR',
                  style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  ctrl1.clear();
                  ctrl2.clear();
                  ctrl3.clear();
                  ctrl4.clear();
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: Text(isloading ? 'Loading...' : 'SUBMIT',
                    style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  final a = ctrl1.text;
                  final b = int.parse(ctrl2.text);
                  final c = ctrl3.text;
                  final d = ctrl4.text;
                  final data = {'nama': a, 'umur': b, 'alamat': c, 'hobi': d};
                  setState(() {
                    isloading = true;
                  });
                  await create(data);
                  setState(() {
                    isloading = false;
                  });
                  ctrl1.clear();
                  ctrl2.clear();
                  ctrl3.clear();
                  ctrl4.clear();
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
