import 'package:dro_home_task/constants.dart';
import 'package:dro_home_task/views/pharmacy/pharmacy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeNavigationScreen extends StatefulWidget {
  const HomeNavigationScreen({Key? key}) : super(key: key);

  @override
  HomeNavigationScreenState createState() => HomeNavigationScreenState();
}

class HomeNavigationScreenState extends State<HomeNavigationScreen> {
  int selectedIndex = 2;

  List<Widget> listOfScreens = <Widget>[
    Container(),
    Container(),
    const PharmacyScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: listOfScreens.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: droPurple,
          unselectedItemColor:navBarUnSelectedItemColor,
          showUnselectedLabels: true,
          onTap: (index) {
            setState(() {
              //selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items:  [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: SvgPicture.asset("assets/icons/home.svg"),
              activeIcon: SvgPicture.asset("assets/icons/home.svg", color: droPurple),
              label: "Home",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: SvgPicture.asset("assets/icons/doctors.svg"),
              activeIcon: SvgPicture.asset("assets/icons/doctors.svg", color: droPurple),
              label: "Doctors",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: SvgPicture.asset("assets/icons/pharmacy.svg"),
              activeIcon: SvgPicture.asset("assets/icons/pharmacy.svg", color: droPurple),
              label: "Pharmacy",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: SvgPicture.asset("assets/icons/community.svg"),
              activeIcon: SvgPicture.asset("assets/icons/community.svg", color: droPurple),
              label: "Community",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: SvgPicture.asset("assets/icons/profile.svg"),
              activeIcon: SvgPicture.asset("assets/icons/profile.svg", color: droPurple),
              label: "Profile",
            ),
          ],
        ));
  }
}
