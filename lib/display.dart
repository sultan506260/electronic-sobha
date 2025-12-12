import 'dart:io';
import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  final File file;

  const DisplayPage({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("File Content")),
      body: FutureBuilder(
        future: file.readAsString(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error reading file: ${snapshot.error}"));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}
