import 'package:easymobile/Provider/SocialMediaDatabaseProvider.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/flush_bar.dart';

class SnapchatDetailScreen extends StatefulWidget {
  SnapchatDetailScreen({Key? key, required this.username}) : super(key: key);
  String username;
  @override
  State<SnapchatDetailScreen> createState() => _SnapchatDetailScreenState();
}

class _SnapchatDetailScreenState extends State<SnapchatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer2<AuthProvider, SocialMediaDatabaseProvider>(
      builder: (context, value, SMDP, child) => Scaffold(
        appBar: appBar(title: "User Details"),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                            height: 180,
                            width: width * 0.9,
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
                                    child: value.snapChatProfileUserModel!
                                                .accountType ==
                                            "private"
                                        ? CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                "${value.snapChatProfileUserModel!.privateAccountData.bitmojiUrl}"))
                                        : CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                "${value.snapChatProfileUserModel!.publicAccountData.profilePictureUrl}")),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${value.snapChatProfileUserModel!.name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Account Type: ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(
                                          "${value.snapChatProfileUserModel!.accountType}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            height: 203,
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
                            height: 203,
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
                // Card(
                //   margin: EdgeInsets.zero,
                //   elevation: 3,
                //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                //   child: ListTile(
                //     leading: value.snapChatProfileUserModel!.accountType ==
                //             "private"
                //         ? CircleAvatar(
                //             radius: 30,
                //             backgroundImage: NetworkImage(
                //                 "${value.snapChatProfileUserModel!.privateAccountData.bitmojiUrl}"))
                //         : CircleAvatar(
                //             radius: 30,
                //             backgroundImage: NetworkImage(
                //                 "${value.snapChatProfileUserModel!.publicAccountData.profilePictureUrl}")),
                //     title: Text("${value.snapChatProfileUserModel!.name} "),
                //     subtitle:
                //         Text("${value.snapChatProfileUserModel!.accountType}",),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () async {
            await SMDP.mGetCheckSnapChat(widget.username);
            if (SMDP.CheckSnapChatModel.length == 1) {
              ErrorFlushbar(
                  context, "SnapChat", "This user have already added");
            } else {
              await SMDP.mUpdateSnapChat(
                value.snapChatProfileUserModel!.accountType == "private"
                    ? value
                        .snapChatProfileUserModel!.privateAccountData.bitmojiUrl
                    : value.snapChatProfileUserModel!.publicAccountData
                        .profilePictureUrl,
                "${value.snapChatProfileUserModel!.name}",
                "${widget.username}",
              );
              SuccessFlushbar(
                  context, "SnapChat", "SNapChat Data Add Successfully");
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
