import 'package:fess/views/screens/college_posts_screen.dart';
import 'package:fess/views/screens/loading_screen.dart';
import 'package:fess/views/screens/post_screen.dart';
import 'package:fess/views/screens/settings_screen.dart';
import 'package:fess/views/screens/university_posts_screen.dart';
import 'package:fess/views/widgets/nav_bar.dart';
import 'package:fess/views/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:fess/views/widgets/tab_item.dart';
import 'package:fess/views/screens/create_post_screen.dart';
import 'package:fess/views/widgets/pencil_icon.dart';
import 'package:fess/views/screens/mood_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override

  // this is static property so other widget throughout the app
  // can access it simply by AppState.currentTab
  static int currentTab = 0;

  // list tabs here
  final List<TabItem> tabs = [
    TabItem(
      page: UniversityPostsScreen(),
      icon: Icon(Icons.home, size: 24, color: Colors.black,),
    ),
    TabItem(
      page: CollegePostsScreen(),
      icon: Icon(Icons.apartment, size: 24, color: Colors.black,),
    ),
    TabItem(
      page: CreatePostScreen(),
      icon: PencilIcon(),
    ),
    TabItem(
      page: MoodScreen(),
      icon: Icon(Icons.chat_bubble_outline, size: 24, color: Colors.black,),
    ),
    TabItem(
      page: SettingsScreen(),
      icon: Icon(Icons.menu, size: 24, color: Colors.black,),
    ),
  ];

  HomeScreenState() {
    // indexing is necessary for proper funcationality
    // of determining which tab is active
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }

  // sets current tab index
  // and update state
  void _selectTab(int index) {
    if (index == currentTab) {
      // pop to first route
      // if the user taps on the active tab
      tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      // update the state
      // in order to repaint
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope handle android back btn
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await tabs[currentTab].key.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (currentTab != 0) {
            // select 'main' tab
            _selectTab(0);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      // this is the base scaffold
      // don't put appbar in here otherwise you might end up
      // with multiple appbars on one screen
      // eventually breaking the app
      child: Scaffold(
        // indexed stack shows only one child
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((e) => e.page).toList(),
        ),
        // Bottom navigation
        bottomNavigationBar: currentTab == 3 ? null : NavBar(onSelectTab: _selectTab, tabs: tabs,),
      ),
    );
  }
}

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFAFAFA),
//       extendBody: true,
//       appBar: AppBar(
//         titleSpacing: 21,
//         shadowColor: Colors.transparent,
//         backgroundColor: const Color(0xff42a4eb),
//         centerTitle: false,
//         title: Text(
//           'Cambridge',
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.w700,
//             color: Colors.white,
//           ),
//         ),
//         actions: [
//           Container(
//             margin: EdgeInsets.only(right: 17),
//             child: Icon(
//               Icons.speed,
//               color: Colors.white,
//               size: 30,
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(right: 21),
//             child: Icon(
//               Icons.filter_alt_outlined,
//               color: Colors.white,
//               size: 30,
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: NavBar(),
//       body: Center(
//         child: Text('Home'),
//       ),
//     );
//   }
// }