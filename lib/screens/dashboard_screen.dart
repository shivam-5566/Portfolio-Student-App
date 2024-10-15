import 'package:flutter/material.dart';
import 'package:portfolio_student_app/screens/portfolio_screen.dart';
import 'home_screen.dart';
import 'input_screen.dart';
import 'profile_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    PortfolioScreen(),
    InputScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Column(
              children: [
                Container(
                  height: 4,
                  width: 65,
                  color: Colors.deepOrange,
                ),
                const  Icon(
                  Icons.home,
                  color: Colors.deepOrange,
                ),
              ],
            ),
            icon:const  Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Column(
              children: [
                Container(
                  height: 4,
                  width: 65,
                  color: Colors.deepOrange,
                ),
                const  Icon(
                  Icons.business_center,
                  color: Colors.deepOrange,
                ),
              ],
            ),
            icon:const  Icon(
              Icons.business_center,
            ),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            activeIcon: Column(
              children: [
                Container(
                  height: 4,
                  width: 65,
                  color: Colors.deepOrange,
                ),
                const Icon(
                  Icons.add_card,
                  color: Colors.deepOrange,
                ),
              ],
            ),
            icon:const  Icon(
              Icons.add_card,
            ),
            label: 'Input',
          ),
          BottomNavigationBarItem(
            activeIcon: Column(
              children: [
                Container(
                  height: 4,
                  width: 65,
                  color: Colors.deepOrange,
                ),
                const Icon(
                  Icons.person,
                  color: Colors.deepOrange,
                ),
              ],
            ),
            icon: const Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
