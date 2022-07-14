import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 200),
        Text(
          'Bisa Logout di Menu Kiri Atas',
          style: TextStyle(
            color: Color.fromRGBO(255, 163, 26, 1),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 80),
        Text(
          'Tugas 1 Ada di Halaman Sebelah',
          style: TextStyle(
            color: Color.fromRGBO(255, 163, 26, 1),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
