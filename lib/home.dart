import 'package:amelia_prefb/create.dart';
import 'package:amelia_prefb/firestore.dart';
import 'package:amelia_prefb/firestorex.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(width: 10),
            Text('WELCOME', style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 141, 127, 106),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Selamat datang di Aplikasi Saya',
              style: TextStyle(fontSize: 20, color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirestoreX()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 195, 176, 145), // Warna khaki dengan RGB (195, 176, 145)
              ),
              child: const Text(
                'List View',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _launchURL("https://github.com/Amelia06-anf/ameliandini_prefb");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 195, 176, 145), // Warna khaki dengan RGB (195, 176, 145)
              ),
              child: const Text(
                'Buka GitHub',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
