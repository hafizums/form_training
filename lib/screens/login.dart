import 'package:flutter/material.dart';
import 'package:hello_world/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = true;

  @override
  void initState() {
    super.initState();
    getLoginData();
  }

  Future<void> getLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('remember_me') == true) {
      setState(() {
        usernameController.text = prefs.getString('username')!;
        passwordController.text = prefs.getString('password')!;
      });
    } else {
      await prefs.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: "Username")),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      if (_formKey.currentState!.validate()) {
                        await prefs.setString(
                            'username', usernameController.text);
                        await prefs.setString(
                            'password', passwordController.text);
                        await prefs.setBool('remember_me', rememberMe);

                        const snackBar = SnackBar(
                          content: Text('Login information saved'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text("Login")),
                CheckboxListTile(
                  title: const Text("Remember me"),
                  value: rememberMe,
                  onChanged: (newValue) {
                    setState(() {
                      rememberMe = newValue!;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                )
              ],
            ),
          ),
        )));
  }
}
