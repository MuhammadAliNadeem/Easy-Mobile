import 'dart:async';

import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Constants/paths.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Tabbar/Instagram/instagram_detail_screen.dart';
import 'package:easymobile/Widgets/buttons.dart';
import 'package:easymobile/Widgets/flush_bar.dart';
import 'package:easymobile/Widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Provider/SocialMediaDatabaseProvider.dart';
import 'Linkedin_detail_Screen.dart';

class LinkedIn extends StatefulWidget {
  const LinkedIn({Key? key}) : super(key: key);

  @override
  State<LinkedIn> createState() => _LinkedInState();
}

class _LinkedInState extends State<LinkedIn> {
  TextEditingController linkedInUserName = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SocialMediaDatabaseProvider>(context, listen: false)
        .mGetLinkedIn();
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
                  child: linkedin,
                ),
                const SizedBox(
                  height: 30,
                ),
                textField(
                  context: context,
                  lable: "Username",
                  hint: "username",
                  icon: CupertinoIcons.person,
                  controller: linkedInUserName,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                loadingButton(
                    context: context,
                    onPressed: () async {
                      await value.mUpdateLinkedInProfile(linkedInUserName.text);
                      if (value.testtomanyLinkedIn != "Too Many Requests") {
                        if (value.linkedInProfileUserModel!.detail == null) {
                          _btnController.success();
                          Timer(const Duration(milliseconds: 700), () {
                            _btnController.reset();
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: LinkedInDetailScreen(
                                username: linkedInUserName.text,
                              ),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          });
                        } else {
                          _btnController.error();
                          ErrorFlushbar(context, "Linkedin", "No User Found");
                          Timer(const Duration(seconds: 2), () {
                            _btnController.reset();
                          });
                        }
                      } else {
                        _btnController.error();
                        ErrorFlushbar(context, "Linkedin",
                            "Please Change the api key Thank you");
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
                    itemCount: SMDP.LinkedInModel.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Card(
                          margin: EdgeInsets.zero,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 28,
                                  backgroundImage: NetworkImage(
                                      SMDP.LinkedInModel[index].imageUrl!)),
                              title: Text(
                                "${SMDP.LinkedInModel[index].name!} ",
                                style: TextStyle(fontSize: 14),
                              ),
                              subtitle: Text(
                                "${SMDP.LinkedInModel[index].userName!}",
                                style: TextStyle(fontSize: 11),
                              ),
                              onTap: () async {
                                print("object");
                                print(SMDP.LinkedInModel[index].userName!);
                                await value.mUpdateLinkedInProfile(
                                    SMDP.LinkedInModel[index].userName!);
                                if (value.testtomanyLinkedIn !=
                                    "Too Many Requests") {
                                  if (value.linkedInProfileUserModel!.detail ==
                                      null) {
                                    PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: LinkedInDetailScreen(
                                username: SMDP.LinkedInModel[index].userName!,
                              ),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                                  } else {
                                    ErrorFlushbar(
                                        context, "Linkedin", "No User Found");
                                  }
                                } else {
                                  ErrorFlushbar(context, "Linkedin",
                                      "Please Change the api key Thank you");
                                }
                              },
                              trailing: IconButton(
                                  onPressed: () {
                                    SMDP.mDeleteLinkedIn(
                                        SMDP.LinkedInModel[index].id!);
                                    // deleteInstagramUser(
                                    //     context, SMDP.instagramModel[index].id!);
                                  },
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  )),
                            ),
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
