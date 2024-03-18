import 'package:flutter/material.dart';
import 'package:nrh_project/Pagees/Personnes_page.dart';

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
  void _showItemSelection(BuildContext context) {
    Widget _buildAdditionalItem(
        BuildContext context, IconData icon, String itemName, Color color) {
      return GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: Color.fromARGB(255, 87, 87, 87),
            ),
            SizedBox(height: 4),
            Text(
              itemName,
              style: TextStyle(
                color: Color.fromARGB(255, 87, 87, 87),
              ),
            ),
          ],
        ),
      );
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildAdditionalItem(
                context,
                Icons.settings_outlined,
                'Settings',
                Color.fromARGB(255, 87, 87, 87),
              ),
              _buildAdditionalItem(
                context,
                Icons.person_outlined,
                'Personnes',
                Color.fromARGB(255, 87, 87, 87),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: BottomNavigationBar(
        currentIndex: widget.selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 4) {
            // Assuming "Plus" is the last item
            _showItemSelection(context);
          } else {
            widget.onItemTapped(index);
          }
        },
        backgroundColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showUnselectedLabels: true,
        selectedItemColor: Color.fromRGBO(113, 82, 243, 1),
        unselectedItemColor: Color.fromARGB(255, 87, 87, 87),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.timer_outlined), label: "Pointer"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outlined), label: "Social"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Absence"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: "Calendar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.widgets_outlined), label: "Plus"),
        ],
      ),
    );
  }
}
