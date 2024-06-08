import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Friends, Image11, Image12 }
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;
  List<BottomMenuModel> bottomMenuList = [
  BottomMenuModel(
    icon: Icons.people,
    color: appTheme.cyan300,
    activeIcon: Icons.people,
    type: BottomBarEnum.Friends,
  ),
  BottomMenuModel(
    icon: Icons.home,
    color: appTheme.cyan300,
    activeIcon: Icons.home,
    type: BottomBarEnum.Image11,
  ),
  BottomMenuModel(
    icon: Icons.person_2,
    color: appTheme.cyan300,
    activeIcon: Icons.person_2,
    type: BottomBarEnum.Image12,
  ),
];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.v,
      decoration: BoxDecoration(
        color: Color.fromRGBO(250, 249, 246, 1),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.h),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          bottomMenuList.length,
          (index) {
            return BottomNavigationBarItem(
  icon: Icon(bottomMenuList[index].icon),
  activeIcon: Icon(bottomMenuList[index].activeIcon),
  label: '',
);
          },
        ),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.color,
    required this.type,
  });

  IconData icon;
  IconData activeIcon;
  Color color;
  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
