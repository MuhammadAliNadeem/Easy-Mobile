import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Constants/paths.dart';
import 'package:easymobile/Screens/Profile/edit_profile_screen.dart';
import 'package:easymobile/Screens/Profile/profile_screen.dart';
import 'package:easymobile/Screens/Tabbar/Linkedin/LinkedInProfile.dart';
import 'package:easymobile/Screens/Tabbar/Snapchat/Snapchat_home.dart';
import 'package:easymobile/Screens/Tabbar/Whatsapp.dart/Whatsapp_Home.dart';
import 'package:easymobile/Screens/Tabbar/Contact/contact_screen.dart';
import 'package:easymobile/Screens/Tabbar/Instagram/instagram_screen.dart';
import 'package:easymobile/Screens/Tabbar/Facebook/facebook_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  TabController? _tabController;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          //=========================== Head Section ===========================
          Container(
            height: height * 0.25,
            width: width,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(80)),
              color: primaryClr,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Easy Mobile",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      GestureDetector(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const ProfileScreen(),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: SizedBox(
                            height: 33,
                            width: 33,
                            child: profile,
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            width: width * 0.9,
                            height: 50,
                            decoration: BoxDecoration(
                              color: secondryClr,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              padding: const EdgeInsets.all(3),
                              labelColor: primaryClr,
                              unselectedLabelColor: Colors.white,
                              labelStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  fontFamily: "Poppins"),
                              automaticIndicatorColorAdjustment: true,
                              // overlayColor:,
                              indicator: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              tabs: [
                                const Tab(
                                  text: "LinkedIn",
                                ),
                                const Tab(
                                  text: "SnapChat",
                                ),
                                const Tab(
                                  text: "Whatsapp",
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Flexible(
                          child: SizedBox(
                            child: const TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                LinkedIn(),
                                Snapchat(),
                                Whatsapp(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
