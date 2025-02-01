// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).width > 600 ? 110 : 60,
      // width: double.infinity,
      decoration: ShapeDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF475A74),
          Color(0xFF8C9EB7)
        ]),
          // image: DecorationImage(
          //     fit: BoxFit.fill,
          //     image: AssetImage('assets/images/auth_images/bottombar.png')),
          shape:
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                 
                )
              )),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context , 0 , Icons.directions_car),
              _buildNavItem(context , 1 , Icons.place_outlined),
              _buildNavItem(context , 2 , Icons.person),
              _buildNavItem(context , 3 , Icons.settings_outlined),
            ],
          ),
          // Positioned(
          //   top: -20,
          //   left: 0,
          //   right: 0,
          //   child: GestureDetector(
          //     onTap: () => onItemSelected(2),
          //     child: Container(
          //       width: 60,
          //       height: 60,
          //       decoration: BoxDecoration(
          //         color: const Color(0xFF4A6DA7), // الأزرق في الصورة
          //         shape: BoxShape.circle,
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey.withOpacity(0.3),
          //             blurRadius: 8,
          //           ),
          //         ],
          //       ),
          //       child: const Center(
          //         child: Text(
          //           "Check",
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 14,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildNavItem( BuildContext context ,int index, IconData icon) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.amberAccent : Colors.white,
              size: MediaQuery.sizeOf(context).width > 600 ? 50 : null,
            ),
           
          ],
        ),
      ),
    );
  }
}
