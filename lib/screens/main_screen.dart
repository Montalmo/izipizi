import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izipizi/screens/devices_screen.dart';
import 'package:izipizi/screens/news_screen.dart';
import 'package:izipizi/screens/profile_screen.dart';
import 'package:izipizi/screens/share_screen.dart';

import '../theme/pallets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const routeName = 'main-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> screens = [
    const DevicesScreen(),
    const NewsScreen(),
    const ShareScreen(),
    const ShareScreen(),
    const ProfileScreen(),
  ];

  void _tapSelectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          enableFeedback: false,
          currentIndex: _selectedIndex,
          onTap: _tapSelectPage,
          unselectedLabelStyle: const TextStyle(color: ColorPallet.cGrayText),
          selectedLabelStyle: const TextStyle(fontSize: 12, color: Colors.red),
          unselectedItemColor: ColorPallet.cGrayText,
          selectedItemColor: ColorPallet.cCyan600,
          type: BottomNavigationBarType.fixed,
          unselectedIconTheme:
              const IconThemeData(color: ColorPallet.cGrayDarkContainer),
          items: [
            BottomNavigationBarItem(
              icon: (_selectedIndex == 0)
                  ? SvgPicture.asset('assets/svgs/cards_icon.svg')
                  : SvgPicture.asset('assets/svgs/cards_na_icon.svg'),
              label: 'Пристрої',
            ),
            BottomNavigationBarItem(
              icon: (_selectedIndex == 1)
                  ? SvgPicture.asset('assets/svgs/news_icon.svg')
                  : SvgPicture.asset('assets/svgs/news_na_icon.svg'),
              label: 'Новини',
            ),
            BottomNavigationBarItem(
              icon: (_selectedIndex == 2)
                  ? SvgPicture.asset('assets/svgs/ananas_icon.svg')
                  : SvgPicture.asset('assets/svgs/ananas_na_icon.svg'),
              label: 'Поділитись',
            ),
            BottomNavigationBarItem(
              icon: (_selectedIndex == 3)
                  ? SvgPicture.asset('assets/svgs/contacts_icon.svg')
                  : SvgPicture.asset('assets/svgs/contacts_na_icon.svg'),
              label: 'Контакти',
            ),
            BottomNavigationBarItem(
              icon: (_selectedIndex == 4)
                  ? SvgPicture.asset('assets/svgs/profile_icon.svg')
                  : SvgPicture.asset('assets/svgs/profile_na_icon.svg'),
              label: 'Профіль',
            ),
          ]),
    );
  }
}
