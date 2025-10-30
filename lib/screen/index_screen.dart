import 'package:bankapp/screen/homescreen.dart';
import 'package:bankapp/widget/bottom_navbar.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: IndexedStack(
        index: currentIndex,
        children: [
          Homescreen(),
          Scaffold(backgroundColor: Colors.red),

          Scaffold(backgroundColor: Colors.yellow),
          Scaffold(backgroundColor: Colors.green),
          Scaffold(backgroundColor: Colors.black),
          // Withdrawals(date: now),
          // Stores(),
          // Vitualcard(),
          // Profile(),
        ],
      ),

      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomNavBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
        ),
      ),
    );
  }
}
