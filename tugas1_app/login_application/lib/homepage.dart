import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_application/loginpage.dart';
import 'package:login_application/primaryblack.dart';

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Homepage',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [SizedBox(width: 20), Icon(Icons.search)],
      ),
      body: Container(
        alignment: Alignment.center,
        color: primaryBlack,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 275),
              ElevatedButton(
                onPressed: () {
                  _signOut().then((value) => Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginPage())));
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(255, 163, 26, 1),
                  onPrimary: Colors.black,
                  shadowColor: Colors.orangeAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: const Size(90, 40),
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
