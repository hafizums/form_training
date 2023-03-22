import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(decoration: InputDecoration(labelText: "Username")),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Login"))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        )));
  }
}
