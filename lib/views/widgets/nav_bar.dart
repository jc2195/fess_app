import 'package:fess/views/widgets/pencil_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fess/views/widgets/tab_item.dart';
import 'package:fess/views/screens/home_screen.dart';

class NavBar extends StatelessWidget {

  NavBar({
    this.onSelectTab,
    this.tabs,
  });
  final ValueChanged<int> onSelectTab;
  final List<TabItem> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color(0xFFD0D0D0), offset: Offset(0, -1)),
          BoxShadow(color: Color(0xFFD0D0D0), offset: Offset(-1, 0)),
          BoxShadow(color: Color(0xFFD0D0D0), offset: Offset(1, 0)),
        ],
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ),
      ),
      child: ClipRRect(
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(20.0),
        //   topRight: Radius.circular(20.0),
        // ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: tabs
              .map(
                (e) => _buildItem(
              index: e.getIndex(),
              icon: e.icon,
            ),
          )
              .toList(),
          onTap: (index) => onSelectTab(
            index,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(
      {int index, icon, String tabName}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: '',
    );
  }

  Color _tabColor({int index}) {
    return HomeScreenState.currentTab == index ? Colors.cyan : Colors.grey;
  }
}