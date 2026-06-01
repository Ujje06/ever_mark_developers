



import 'package:ever_mark_developers/presentation/pages/home/widgets/home_screen_background.dart';
import 'package:ever_mark_developers/presentation/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
// import '../../helper/widgets/bottom_nav/bottom_nav_bar.dart'
import '../../../custom_bottom_drawer/custom_bottom_nav.dart';
import '../../../custom_bottom_drawer/enums/nav_animation.dart';
import '../../../custom_bottom_drawer/enums/nav_style.dart';
import '../../../custom_bottom_drawer/nav_item.dart';
import '../../widgets/drawer/app_drawer.dart';
import '../profile/profile_page.dart';
import '../search/search_page.dart';
import 'home_navbar.dart';
import 'home_screen_content.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey =
  GlobalKey<ScaffoldState>();

  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreenContent(),
    SearchPage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF8FAFC),
      drawer: const AppDrawer(),



      // 3. Wrap your interface column with the dynamic ambient backdrop container
      body: HomeScreenBackground(
        child: SafeArea(
          child: Column(
            children: [
              /// Top Animated Gradient Navbar
              HomeNavbar(
                onMenuTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
              ),

              /// Page Switcher Layer (Home Content, Search, Settings, Profile)
              Expanded(
                child: IndexedStack(
                  index: currentIndex,
                  children: pages,
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        style: NavStyle.dark,
        animation: NavAnimation.scale,
        items: [
          NavItem(icon: Icons.home, label: "Home"),
          NavItem(icon: Icons.search, label: "Search"),
          NavItem(icon: Icons.settings, label: "Settings"),
          NavItem(icon: Icons.person, label: "Profile"),
        ],
        onChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}



      // body: SafeArea(
      //   child: Column(
      //     children: [
      //
      //       /// Top Navbar
      //       HomeNavbar(
      //         onMenuTap: () {
      //           scaffoldKey.currentState
      //               ?.openDrawer();
      //         },
      //       ),
      //
      //       Expanded(
      //         child: IndexedStack(
      //           index: currentIndex,
      //           children: pages,
      //         ),
      //       ),
      //
      //
      //
      //
      //     ],
      //   ),
      // ),
      //
      //
      //

      // bottomNavigationBar: CustomBottomNav(
      //
      //   currentIndex: currentIndex,
      //
      //   /// 🔥 STYLE
      //   // style: NavStyle.glass,
      //   // style: NavStyle.glass,
      //   style: NavStyle.dark,
      //
      //   /// 🔥 ANIMATION
      //   // animation: NavAnimation.bounce,
      //   animation: NavAnimation.scale,
      //
      //   items: [
      //
      //     NavItem(
      //       icon: Icons.home,
      //       label: "Home",
      //     ),
      //
      //     NavItem(
      //       icon: Icons.search,
      //       label: "Search",
      //     ),
      //
      //     NavItem(
      //       icon: Icons.settings,
      //       label: "Settings",
      //     ),
      //
      //     NavItem(
      //       icon: Icons.person,
      //       label: "Profile",
      //     ),
      //
      //   ],
      //
      //   onChanged: (index) {
      //
      //     setState(() {
      //
      //       currentIndex = index;
      //
      //     });
      //
      //   },
      // ),



//
//
//     );
//   }
// }












