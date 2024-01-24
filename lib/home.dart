import 'package:amelia_prefb/firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 2, 56),
        title: const Row(
          children: [
            SizedBox(width: 10),
            Text('WELCOME', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 65, 127),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Selamat datang di Aplikasi Flutter',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _launchURL("https://github.com/Amelia06-anf/ameliandini_prefb");
              },
              child: const Text('Buka GitHub'),
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
