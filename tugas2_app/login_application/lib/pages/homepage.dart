import 'package:flutter/material.dart';
import 'package:login_application/colors/primaryblack.dart';
import 'package:login_application/widgets/drawer_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'Homepage',
          style: TextStyle(
            color: Color.fromRGBO(255, 163, 26, 1),
          ),
        ),
        centerTitle: true,
        actions: const [SizedBox(width: 20), Icon(Icons.search)],
      ),
      body: Container(
        alignment: Alignment.center,
        color: primaryBlack,
        child: const Center(
          child: Text(
            'Bisa Logout di Menu Kanan Atas',
            style: TextStyle(
              color: Color.fromRGBO(255, 163, 26, 1),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
