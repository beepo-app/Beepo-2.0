import 'package:beepo/screens/browser/browser.dart';
import 'package:beepo/screens/profile/profile_screen.dart';
import 'package:beepo/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../screens/messaging/chat_tabs_screen.dart';

class BottomNavHome extends StatefulWidget {
  const BottomNavHome({Key? key}) : super(key: key);

  @override
  State<BottomNavHome> createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  int index = 0;
  List<Widget> body = [
    const ChatTabsScreen(),
    const WalletScreen(),
    const Browser(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: body[index],
        extendBody: false,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color(0xffFF9C34),
          onTap: (int selectedPage) {
            setState(() => index = selectedPage);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.message),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.global),
              label: 'Browser',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.security_user),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
