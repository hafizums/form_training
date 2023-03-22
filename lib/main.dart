import 'package:flutter/material.dart';
import 'package:hello_world/provider/counter.dart';
import 'package:hello_world/screens/counter.dart';
import 'package:hello_world/screens/home_screen.dart';
import 'package:hello_world/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Counter(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context, listen: true);
    return Scaffold(
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        children: [
          Container(
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {},
                child: const Icon(Icons.clear),
              )),
          Container(
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () => counter.increment(),
                child: const Icon(Icons.add),
              )),
        ],
      ),
      appBar: AppBar(
        title: const Text("App State Tutorials"),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("You have pushed the button this many times:"),
        Text(
          counter.value.toString(),
          style: const TextStyle(fontSize: 25),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CounterScreen()));
            },
            child: const Text("Go to next screen"))
      ])),
    );
  }
}
