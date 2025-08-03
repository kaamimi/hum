import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test View')),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children: [
          Container(color: Colors.red, height: 100, width: 100),
          Container(color: Colors.green, height: 100, width: 100),
          Container(color: Colors.blue, height: 100, width: 100),
          Container(color: Colors.orange, height: 100, width: 100),
          Container(color: Colors.teal, height: 100, width: 100),
          Container(color: Colors.purple, height: 100, width: 100),
          Container(color: Colors.pink, height: 100, width: 100),
          Container(color: Colors.lightGreen, height: 100, width: 100),
          Container(color: Colors.yellow, height: 100, width: 100),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.male_sharp), label: "Diary"),
          NavigationDestination(icon: Icon(Icons.male_sharp), label: "Diary"),
        ],
        onDestinationSelected: (int index) {},
      ),
    );
  }
}
