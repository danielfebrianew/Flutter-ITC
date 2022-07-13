import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_application/homepage.dart';
import 'package:login_application/primaryblack.dart';
import 'package:login_application/registrationpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// ignore: camel_case_types
class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(35, 40, 40, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: primaryBlack,
            ),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  _textMasuk(),
                  const SizedBox(
                    height: 50,
                  ),
                  _emailField(),
                  const SizedBox(
                    height: 25,
                  ),
                  _passwordField(),
                  const SizedBox(
                    height: 45,
                  ),
                  _loginButton(),
                  const SizedBox(
                    height: 30,
                  ),
                  _buttonDaftar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textMasuk() {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Masuk',
        style: TextStyle(
          color: Color.fromRGBO(255, 163, 26, 1),
          fontSize: 45,
          fontFamily: 'Arial',
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _emailField() {
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        validator: validateEmail,
        enabled: true,
        controller: _emailController,
        style: const TextStyle(
          color: Color.fromRGBO(255, 163, 26, 1),
        ),
        cursorColor: const Color.fromRGBO(255, 163, 26, 1),
        decoration: InputDecoration(
          icon: const Icon(
            Icons.mail,
            color: Color.fromRGBO(255, 163, 26, 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 3,
              color: Color.fromRGBO(255, 163, 26, 1),
            ),
          ),
          focusColor: Colors.white,
          filled: true,
          fillColor: const Color.fromARGB(255, 14, 14, 14),
          labelText: 'Email',
          labelStyle: const TextStyle(
            color: Color.fromRGBO(255, 163, 26, 1),
          ),
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        validator: validatePassword,
        enabled: true,
        controller: _passwordController,
        style: const TextStyle(
          color: Color.fromRGBO(255, 163, 26, 1),
        ),
        cursorColor: const Color.fromRGBO(255, 163, 26, 1),
        obscureText: _obscureText,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.key,
            color: Color.fromRGBO(255, 163, 26, 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color.fromRGBO(255, 163, 26, 1),
              width: 3,
            ),
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 14, 14, 14),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: const Color.fromRGBO(255, 163, 26, 1),
            ),
          ),
          labelText: 'Password',
          labelStyle: const TextStyle(
            color: Color.fromRGBO(255, 163, 26, 1),
          ),
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(255, 163, 26, 1),
          onPrimary: Colors.black,
          shadowColor: Colors.orangeAccent,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          minimumSize: const Size(90, 40),
        ),
        child: const Text(
          'Masuk',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          try {
            if (_key.currentState!.validate()) {
              await _firebaseAuth
                  .signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  )
                  .then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homepage(),
                      ),
                    ),
                  );
            }
          } on Exception catch (e) {
            SnackBar snackBar = SnackBar(
              content: Text("Error : $e"),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
    );
  }

  Widget _buttonDaftar() {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Belum punya akun?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistrationPage(),
                ),
              );
            },
            child: const Text(
              'Daftar',
              style: TextStyle(
                color: Color.fromRGBO(255, 163, 26, 1),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return "E-mail Address is Required";
    } else {
      return null;
    }
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return "Password is Required";
    } else {
      return null;
    }
  }
}
