import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:easymobile/Constants/paths.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Tabbar/Snapchat/SnapChat_detail_screen.dart';
import 'package:easymobile/Screens/Tabbar/Whatsapp.dart/whatsapp_detail_Screen.dart';
import 'package:easymobile/Widgets/buttons.dart';
import 'package:easymobile/Widgets/flush_bar.dart';
import 'package:easymobile/Widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Constants/colors.dart';
import '../../../Provider/SocialMediaDatabaseProvider.dart';

class Snapchat extends StatefulWidget {
  const Snapchat({Key? key}) : super(key: key);

  @override
  State<Snapchat> createState() => _SnapchatState();
}

class _SnapchatState extends State<Snapchat> {
  TextEditingController snapchatUsername = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SocialMediaDatabaseProvider>(context, listen: false)
        .mGetSnapChat();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer2<AuthProvider, SocialMediaDatabaseProvider>(
      builder: (context, value, SMDP, child) => Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: snapchat,
                ),
                const SizedBox(
                  height: 30,
                ),
                textField(
                  context: context,
                  lable: "Username",
                  hint: "Username",
                  icon: CupertinoIcons.person,
                  controller: snapchatUsername,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                loadingButton(
                    context: context,
                    onPressed: () async {
                      await value.mUpdateSNapChatProfile(snapchatUsername.text);
                      if (value.testtomanySnapchat != "Too Many Requests") {
                        if (value.snapChatProfileUserModel!.accountType ==
                                "private" ||
                            value.snapChatProfileUserModel!.accountType ==
                                "public") {
                          _btnController.success();
                          Timer(const Duration(milliseconds: 700), () {
                            _btnController.reset();
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: SnapchatDetailScreen(
                                username: snapchatUsername.text,
                              ),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          });
                        } else {
                          _btnController.error();
                          ErrorFlushbar(context, "SnapChat",
                              "No SnapChat Account is Available");
                          Timer(const Duration(milliseconds: 700), () {
                            _btnController.reset();
                          });
                        }
                      } else {
                        _btnController.error();
                        ErrorFlushbar(context, "SnapChat",
                            "Please Change the api key thank you...!!!");
                        Timer(const Duration(milliseconds: 700), () {
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
                    itemCount: SMDP.SnapChatModel.length,
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
                                    SMDP.SnapChatModel[index].imageUrl!)),
                            title: Text(
                              "${SMDP.SnapChatModel[index].name!} ",
                              style: TextStyle(fontSize: 14),
                            ),
                            subtitle: Text(
                              "${SMDP.SnapChatModel[index].userName!}",
                              style: TextStyle(fontSize: 11),
                            ),
                            onTap: () {
                              // launchUrl(Uri.parse(
                              //     "https://www.snapchat.com/add/${SMDP.SnapChatModel[index].userName}?share_id=wlC--D_D9K0&locale=en-GB"));
                            },
                            trailing: IconButton(
                                onPressed: () {
                                  SMDP.mDeleteSnapChat(
                                      SMDP.SnapChatModel[index].id!);
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
      ),
    );
  }
}
