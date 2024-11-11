import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/marketplace_screen.dart';
import 'screens/waste_management_screen.dart';
import 'screens/energy_calculator_screen.dart';
import 'screens/fashion_tracker_screen.dart';
import 'screens/community_screflutter create .
en.dart';
import 'screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EcoMateApp());
}

class EcoMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoMate',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final screens = [
    const MarketplaceScreen(),
    const WasteManagementScreen(),
    const EnergyCalculatorScreen(),
    const FashionTrackerScreen(),
    const CommunityScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Marketplace'),
          BottomNavigationBarItem(icon: Icon(Icons.recycling), label: 'Waste Mgmt'),
          BottomNavigationBarItem(icon: Icon(Icons.bolt), label: 'Energy Calc'),
          BottomNavigationBarItem(icon: Icon(Icons.style), label: 'Fashion'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
