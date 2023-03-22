import 'package:flutter/material.dart';
import 'package:hello_world/provider/counter.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context, listen: true);
    return Center(
      child: Text(
        counter.value.toString(),
        style: const TextStyle(fontSize: 35),
      ),
    );
  }
}
