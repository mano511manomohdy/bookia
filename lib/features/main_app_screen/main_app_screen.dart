import 'dart:ui';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/features/Home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // allows nav bar to overlay body
      body: screens[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ), // more blur for frosty look
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                0.15,
              ), // more transparent glassy effect
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent, // keep transparent
              elevation: 0,
              currentIndex: currentIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (index) => setState(() => currentIndex = index),

              // Remove ripple/splash/highlight effect
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.white70,
              enableFeedback: false,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Home.svg"),
                  label: "Home",
                  activeIcon: SvgPicture.asset(
                    "assets/icons/Home.svg",
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Bookmark.svg"),
                  label: "Wishlist",
                  activeIcon: SvgPicture.asset(
                    "assets/icons/Bookmark.svg",
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Category.svg"),
                  label: "Cart",
                  activeIcon: SvgPicture.asset(
                    "assets/icons/Category.svg",
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Profile.svg"),
                  label: "Profile",
                  activeIcon: SvgPicture.asset(
                    "assets/icons/Profile.svg",
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
