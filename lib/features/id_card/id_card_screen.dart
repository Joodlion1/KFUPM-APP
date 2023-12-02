import 'package:flutter/material.dart';

class StudentIDScreen extends StatelessWidget {
  const StudentIDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text('Student ID'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 70),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 217, 237, 210),
              ),
              child: Image.asset('assets/images/id.png'),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
 