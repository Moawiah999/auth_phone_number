import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("phone number"),
      ),
      body: const Center(
        child: Text(
          "Well done, you have successfully logged in",
          style: TextStyle(color: Colors.amber, fontSize: 22),
        ),
      ),
    );
  }
}
