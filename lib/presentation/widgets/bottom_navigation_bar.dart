// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app/constants/colors.dart';

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
      height: MediaQuery.sizeOf(context).width > 600 ? 110 : 50,
      // width: double.infinity,
      decoration: ShapeDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF96A5B8), Color(0xFF7793B7)]),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, 0, CupertinoIcons.car),
          _buildNavItem(context, 1, Icons.place_outlined),
          _buildNavItem(context, 2, Icons.person),
          _buildNavItem(context, 3, Icons.settings_outlined),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData icon) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSelected
                ? Container(
                    padding: EdgeInsets.all(5),
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: Colors.white),
                    child: Icon(
                      icon,
                      color: isSelected ? MyColors.premiumColor : Colors.white,
                      size: MediaQuery.sizeOf(context).width > 600 ? 50 : null,
                    ),
                  )
                : Icon(
                    icon,
                    color: isSelected ? MyColors.premiumColor : Colors.white,
                    size: MediaQuery.sizeOf(context).width > 600 ? 50 : null,
                  ),
          ],
        ),
      ),
    );
  }
}
