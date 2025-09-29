import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  bool isLoginSuccess = false;

  final String pass = '1234';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: const Color.fromARGB(255, 147, 198, 238),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _usernameField(),
          _passwordField(),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: usernameC,
        decoration: const InputDecoration(
          hintText: "Username anda",
          fillColor: Color.fromARGB(255, 191, 223, 248),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: passwordC,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "Password anda",
          fillColor: Color.fromARGB(255, 191, 223, 248),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _login,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 79, 158, 182),
        ),
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  void _login() {
    String text = '';

    if (passwordC.text == pass) {
      // login sukses
      setState(() {
        text = "Login Berhasil";
        isLoginSuccess = true;
      });
    } else {
      // login gagal
      setState(() {
        text = "Username atau Password salah!";
        isLoginSuccess = false;
      });
    }

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
      duration: const Duration(milliseconds: 800), // singkat saja
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    if (isLoginSuccess) {
      Future.delayed(const Duration(milliseconds: 700), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(username: usernameC.text),
          ),
        );
      });
    }
  }
}
