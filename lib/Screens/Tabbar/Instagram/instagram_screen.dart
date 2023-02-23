import 'dart:async';

import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Constants/paths.dart';
import 'package:easymobile/Provider/SocialMediaDatabaseProvider.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Tabbar/Instagram/instagram_detail_screen.dart';
import 'package:easymobile/Widgets/DeleteWidget.dart';
import 'package:easymobile/Widgets/buttons.dart';
import 'package:easymobile/Widgets/flush_bar.dart';
import 'package:easymobile/Widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramScreen extends StatefulWidget {
  const InstagramScreen({Key? key}) : super(key: key);

  @override
  State<InstagramScreen> createState() => _InstagramScreenState();
}

class _InstagramScreenState extends State<InstagramScreen> {
  TextEditingController instagramUserName = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SocialMediaDatabaseProvider>(context, listen: false)
        .mGetInstagram();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer2<AuthProvider, SocialMediaDatabaseProvider>(
      builder: (context, value, SMDP, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: instagram,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: textField(
                  context: context,
                  lable: "Username",
                  hint: "username",
                  icon: CupertinoIcons.person,
                  controller: instagramUserName,
                  inputType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              loadingButton(
                  context: context,
                  onPressed: () async {
                    await value
                        .mUpdateinstagramUserName(instagramUserName.text);

                    if (value.checkInstgaram == "yes") {
                      await value
                          .mUpdateInstagramFollowers(instagramUserName.text);
                      await value
                          .mUpdateInstagramFollowing(instagramUserName.text);
                      _btnController.success();
                      Timer(const Duration(milliseconds: 700), () {
                        _btnController.reset();
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: InstagramDetailScreen(
                            username: instagramUserName.text,
                          ),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      });
                    } else {
                      _btnController.error();
                      ErrorFlushbar(context, "Instagram",
                          "No Instaagram account found or Please Change the api key thank you....");
                      Timer(const Duration(seconds: 2), () {
                        _btnController.reset();
                      });
                    }
                  },
                  text: "Continue",
                  width: width * 0.8,
                  btnController: _btnController),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: SMDP.instagramModel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(
                                  SMDP.instagramModel[index].imageUrl!)),
                          title: Text(
                            "${SMDP.instagramModel[index].name!} ",
                            style: TextStyle(fontSize: 14),
                          ),
                          subtitle: Text(
                            "${SMDP.instagramModel[index].userName!}",
                            style: TextStyle(fontSize: 12),
                          ),
                          onTap: () async {
                            await value.mUpdateinstagramUserName(
                                SMDP.instagramModel[index].userName!);
                            if (value.checkInstgaram == "Too Many Requests") {
                              await value.mUpdateInstagramFollowers(
                                  SMDP.instagramModel[index].userName!);
                              await value.mUpdateInstagramFollowing(
                                  SMDP.instagramModel[index].userName!);
                              _btnController.success();
                              Timer(const Duration(milliseconds: 700), () {
                                _btnController.reset();
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: InstagramDetailScreen(
                                    username:
                                        SMDP.instagramModel[index].userName!,
                                  ),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              });
                            } else {
                              _btnController.error();
                              ErrorFlushbar(context, "Instagram",
                                  "Please Change the api key thank you....");
                              Timer(const Duration(seconds: 2), () {
                                _btnController.reset();
                              });
                            }
                          },
                          trailing: IconButton(
                              onPressed: () {
                                SMDP.mDeleteInstagram(
                                    SMDP.instagramModel[index].id!);
                                // deleteInstagramUser(
                                //     context, SMDP.instagramModel[index].id!);
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              )),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
