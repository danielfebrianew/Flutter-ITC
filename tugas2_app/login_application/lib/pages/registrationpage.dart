import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_application/pages/loginpage.dart';
import 'package:login_application/colors/primaryblack.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
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
                    height: 20,
                  ),
                  _textDaftar(),
                  const SizedBox(
                    height: 50,
                  ),
                  _emailField(),
                  const SizedBox(
                    height: 25,
                  ),
                  _passwordField(),
                  const SizedBox(
                    height: 30,
                  ),
                  _registerButton(),
                  const SizedBox(
                    height: 20,
                  ),
                  _loginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textDaftar() {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Daftar',
        style: TextStyle(
          color: Color.fromRGBO(255, 163, 26, 1),
          fontSize: 45,
          fontFamily: 'Arial',
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _emailField() {
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        controller: _emailController,
        validator: validateEmail,
        enabled: true,
        cursorColor: const Color.fromRGBO(255, 163, 26, 1),
        style: const TextStyle(
          color: Color.fromRGBO(255, 163, 26, 1),
        ),
        decoration: InputDecoration(
          icon: const Icon(
            Icons.email,
            color: Color.fromRGBO(255, 163, 26, 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 3,
              color: Color.fromRGBO(255, 163, 26, 1),
            ),
          ),
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
        controller: _passwordController,
        validator: validatePassword,
        enabled: true,
        cursorColor: const Color.fromRGBO(255, 163, 26, 1),
        style: const TextStyle(
          color: Color.fromRGBO(255, 163, 26, 1),
        ),
        obscureText: _obscureText,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.key,
            color: Color.fromRGBO(255, 163, 26, 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 3,
              color: Color.fromRGBO(255, 163, 26, 1),
            ),
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 14, 14, 14),
          labelText: 'Password',
          suffixIcon: GestureDetector(
            onTap: () {
              setState(
                () {
                  _obscureText = !_obscureText;
                },
              );
            },
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: const Color.fromRGBO(255, 163, 26, 1),
            ),
          ),
          labelStyle: const TextStyle(
            color: Color.fromRGBO(255, 163, 26, 1),
          ),
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(255, 163, 26, 1),
          onPrimary: Colors.amber.shade50,
          shadowColor: Colors.orangeAccent,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(90, 40),
        ),
        child: const Text(
          'Daftar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          try {
            if (_key.currentState!.validate()) {
              await _firebaseAuth.createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              );
              SnackBar snackBar = const SnackBar(
                content: Text("Register Success!"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              SnackBar snackBar = const SnackBar(
                content: Text("The Password is too Weak!"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (e.code == 'email-already-in-use') {
              SnackBar snackBar = const SnackBar(
                content: Text("There is already an Account with this E-mail!"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (e.code == 'invalid-email') {
              SnackBar snackBar = const SnackBar(
                content: Text("Kesalahan Penulisan Format Email!"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          } catch (e) {
            SnackBar snackBar = SnackBar(
              content: Text("Error : $e"),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sudah memiliki akun?',
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
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: const Text(
              'Masuk',
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
