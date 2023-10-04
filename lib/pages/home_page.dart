import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles'),
      ),
      // the body contains filter text field and list of profiles
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Filter',
              ),
            ),
          ),
          Expanded(
            child: ListView(),
          ),
        ],
      ),
    );
  }
}
