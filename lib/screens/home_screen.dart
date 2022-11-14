import 'package:contactlist/widgets/fav_widget.dart';
import 'package:contactlist/widgets/home_widget.dart';
import 'package:contactlist/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  _setindex(int index) => setState(
        () => _selectedIndex = index,
      );
  final List<Widget> _selectedWidget = [
    const HomeWidget(),
    const FavWidget(),
    const ProfileWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("My Contacts"),
      ),
      body: _selectedWidget[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => _setindex(value),
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: ""),
          ]),
    );
  }
}
