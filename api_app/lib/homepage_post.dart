import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

TextEditingController nameController = TextEditingController();
TextEditingController jobController = TextEditingController();

class HomepagePost extends StatefulWidget {
  const HomepagePost({Key? key}) : super(key: key);

  @override
  State<HomepagePost> createState() => _HomepagePostState();
}

String hasil = "Belum ada Data!";

const TextStyle _mainTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
  color: Colors.white,
);

const TextStyle _secondaryTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
  color: Colors.red,
);

class _HomepagePostState extends State<HomepagePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HTTP POST',
          style: _mainTextStyle,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          TextField(
            style: const TextStyle(
              color: Colors.black,
            ),
            controller: nameController,
            decoration: InputDecoration(
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 3,
                  color: Colors.black,
                ),
              ),
              focusColor: Colors.red,
              filled: true,
              fillColor: Colors.white,
              labelText: 'Name',
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
              contentPadding: const EdgeInsets.all(15),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            style: const TextStyle(
              color: Colors.black,
            ),
            controller: jobController,
            decoration: InputDecoration(
              icon: const Icon(
                Icons.work,
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 3,
                  color: Colors.black,
                ),
              ),
              focusColor: Colors.red,
              filled: true,
              fillColor: Colors.white,
              labelText: 'Job',
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
              contentPadding: const EdgeInsets.all(15),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: (() async {
              var response = await http
                  .post(Uri.parse('https://reqres.in/api/users'), body: {
                "name": nameController.text,
                "job": jobController.text
              });

              var data = json.decode(response.body) as Map<String, dynamic>;
              setState(() {
                hasil = "${data['name']} dan ${data['job']}";
              });
              // print(data);
            }),
            child: const Text('Post'),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              hasil,
              style: _secondaryTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
