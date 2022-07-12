import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late String body;

  @override
  void initState() {
    body = 'belum ada data';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              'Mencoba API',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(body),
            ElevatedButton(
              onPressed: () async {
                var response = await http
                    .get(Uri.parse('https://reqres.in/api/users?page=2'));
                if (response.statusCode == 200) {
                  // berhasil
                  // print('berhasil');
                  var data = json.decode(response.body) as Map<String, dynamic>;
                  setState(() {
                    body = data['data'][0]['email'];
                  });
                } else {
                  //gagal
                  // print('gagal');
                }
              },
              child: const Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}
