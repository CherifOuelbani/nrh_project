import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: BottomNavigationBar(
        currentIndex: widget.selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: widget.onItemTapped,
        backgroundColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showUnselectedLabels: true,
        selectedItemColor: Color.fromRGBO(113, 82, 243, 1),
        unselectedItemColor: Color.fromARGB(255, 87, 87, 87),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Pointer"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Social"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: "Absence"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "Calendar"),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "Plus"),
        ],
      ),
    );
  }
}
