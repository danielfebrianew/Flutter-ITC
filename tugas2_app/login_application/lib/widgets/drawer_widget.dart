import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_application/colors/primaryblack.dart';
import 'package:login_application/pages/loginpage.dart';

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        alignment: Alignment.center,
        color: primaryBlack,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 275),
              ElevatedButton(
                onPressed: () {
                  SnackBar snackBar = const SnackBar(
                    content: Text("Logout Success!"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
