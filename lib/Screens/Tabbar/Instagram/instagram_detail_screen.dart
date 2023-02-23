import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Provider/SocialMediaDatabaseProvider.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Tabbar/Instagram/Instagram_Reels.dart';
import 'package:easymobile/Widgets/app_bar.dart';
import 'package:easymobile/Widgets/flush_bar.dart';
import 'package:easymobile/Widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramDetailScreen extends StatefulWidget {
  InstagramDetailScreen({Key? key, required this.username}) : super(key: key);
  String username;
  @override
  State<InstagramDetailScreen> createState() => _InstagramDetailScreenState();
}

class _InstagramDetailScreenState extends State<InstagramDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer2<AuthProvider, SocialMediaDatabaseProvider>(
      builder: (context, value, SMDP, child) => Scaffold(
        appBar: appBar(title: "User Details"),
        body: Center(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 250,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    // color: primaryClr,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: primaryClr, width: 2)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                        "${value.instagramUserModel!.profilePicUrl}",
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${value.instagramUserModel!.fullName}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text("${widget.username}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "${value.instagramFollowersUserModel!.count}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: primaryClr,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 1),
                                          child: Text(
                                            "Followers",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: 40,
                                      child: VerticalDivider(
                                        thickness: 2,
                                      )),
                                  Column(
                                    children: [
                                      Text(
                                        "${value.instagramFollowingsUserModel!.count}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: primaryClr,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 1),
                                          child: Text(
                                            "Followings",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          height: 273,
                          width: 20,
                          decoration: BoxDecoration(
                              color: primaryClr,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                        )),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 273,
                          width: 20,
                          decoration: BoxDecoration(
                              color: primaryClr,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                        )),
                  ],
                ),
              ),

              // ListTile(
              //   leading: CircleAvatar(
              //       radius: 30,
              //       backgroundImage: NetworkImage(
              //           "${value.instagramUserModel!.profilePicUrl}")),
              //   title: Text("${value.instagramUserModel!.fullName}"),
              //   subtitle: Text("${widget.username}"),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text(
              //       "${value.instagramFollowersUserModel!.count}\nFollowers",
              //       textAlign: TextAlign.center,
              //     ),
              //     SizedBox(
              //         height: 50,
              //         child: VerticalDivider(
              //           thickness: 2,
              //         )),
              //     Text(
              //       "${value.instagramFollowingsUserModel!.count}\nFollowings",
              //       textAlign: TextAlign.center,
              //     ),
              //   ],
              // ),
              // Text("${value.instagramUserModel!.fullName}"),
              SizedBox(height: 20,),
              userTile(
                  context: context,
                  title: "Reels",
                  onTap: () async {
                    await value.mUpdateInstagramReels(widget.username);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Instagram_Reels(username: widget.username)));
                  }),
              userTile(
                  context: context,
                  title: "Go to Website",
                  onTap: () async {
                     launchUrl(Uri.parse(
                              "https://web.instagram.com/${widget.username}"));
                  }),
              // userTile(context: context, title: "Followers", onTap: () {}),
              // userTile(context: context, title: "Following", onTap: () {}),
              // userTile(context: context, title: "Posts", onTap: () {}),
            ],
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () async {
            await SMDP.mGetCheckInstagram(widget.username);
            if (SMDP.CheckinstagramModel.length == 1) {
              ErrorFlushbar(
                  context, "Instagram", "This user have already added");
            } else {
              await SMDP.mUpdateInstagram(
                  "${value.instagramUserModel!.profilePicUrl}",
                  "${value.instagramUserModel!.fullName}",
                  "${widget.username}",
                  value.instagramFollowersUserModel!.count,
                  value.instagramFollowingsUserModel!.count);
              SuccessFlushbar(
                  context, "Instagram", "Instagram Data Add Successfully");
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                width: width,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryClr,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Save User Data",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
