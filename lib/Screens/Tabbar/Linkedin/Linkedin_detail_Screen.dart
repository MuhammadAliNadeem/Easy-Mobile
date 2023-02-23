import 'package:easymobile/Provider/SocialMediaDatabaseProvider.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/flush_bar.dart';

class LinkedInDetailScreen extends StatefulWidget {
  LinkedInDetailScreen({Key? key, required this.username}) : super(key: key);
  String username;
  @override
  State<LinkedInDetailScreen> createState() => _LinkedInDetailScreenState();
}

class _LinkedInDetailScreenState extends State<LinkedInDetailScreen> {
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
                const SizedBox(
                  height: 10,
                ),
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
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      // color: primaryClr,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: primaryClr, width: 2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: CircleAvatar(
                                        // radius: 60,
                                        backgroundImage: NetworkImage(
                                            "${value.linkedInProfileUserModel!.profilePicture}")),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${value.linkedInProfileUserModel!.firstName} ${value.linkedInProfileUserModel!.lastName}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  width: width * 0.7,
                                  child: Text(
                                    "${value.linkedInProfileUserModel!.subTitle}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12),
                                  ),
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

                // ListTile(
                //   leading: CircleAvatar(
                //       radius: 30,
                //       backgroundImage: NetworkImage(
                //           "${value.linkedInProfileUserModel!.profilePicture}")),
                //   title: Text(
                //       "${value.linkedInProfileUserModel!.firstName} ${value.linkedInProfileUserModel!.lastName}"),
                //   subtitle: Text("${value.linkedInProfileUserModel!.subTitle}"),
                // ),
                // RichText(
                //   text: TextSpan(
                //     text: 'Location : ',
                //     style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         color: Colors.black,
                //         fontSize: 18),
                //     children: <TextSpan>[
                //       TextSpan(
                //           text:
                //               '${value.linkedInProfileUserModel!.location!.locationDefault}',
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontWeight: FontWeight.w400,
                //               fontSize: 16)),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    width: width * 0.9,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: primaryClr,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1.5, horizontal: 10),
                              child: Text(
                                'Industry',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${value.linkedInProfileUserModel!.industry}',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: primaryClr,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1.5, horizontal: 10),
                              child: Text(
                                'Bio',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${value.linkedInProfileUserModel!.summary}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),

                          // RichText(
                          //   text: TextSpan(
                          //     text: 'Description: ',
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.black,
                          //         fontFamily: "Poppins",
                          //         fontSize: 14),
                          //     children: <TextSpan>[
                          //       TextSpan(
                          //           text:
                          //               '${value.linkedInProfileUserModel!.summary}',
                          //           style: TextStyle(
                          //               color: Colors.black,
                          //               fontWeight: FontWeight.w400,
                          //               fontSize: 13)),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),

                // value.linkedInProfileUserModel!.education!.length == 0
                //     ? SizedBox()
                //     : Text(
                //         "Education",
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                // value.linkedInProfileUserModel!.education!.length == 0
                //     ? SizedBox()
                //     : ListView.builder(
                //         physics: NeverScrollableScrollPhysics(),
                //         shrinkWrap: true,
                //         itemCount:
                //             value.linkedInProfileUserModel!.education!.length,
                //         itemBuilder: (context, index) {
                //           return Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Text(
                //                 "${index + 1} : ${value.linkedInProfileUserModel!.education![index].school!.name}",
                //                 style: TextStyle(fontWeight: FontWeight.bold),
                //               ),
                //               Text(
                //                   "${value.linkedInProfileUserModel!.education![index].degreeName}, Start ${value.linkedInProfileUserModel!.education![index].date!.start!.year}  End ${value.linkedInProfileUserModel!.education![index].date!.end!.year}")
                //             ],
                //           );
                //         }),
                // value.linkedInProfileUserModel!.skills!.length == 0
                //     ? SizedBox()
                //     : Text(
                //         "Skills",
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                // value.linkedInProfileUserModel!.skills!.length == 0
                //     ? SizedBox()
                //     : ListView.builder(
                //         physics: NeverScrollableScrollPhysics(),
                //         shrinkWrap: true,
                //         itemCount:
                //             value.linkedInProfileUserModel!.skills!.length,
                //         itemBuilder: (context, index) {
                //           return Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Text(
                //                   "${index + 1} : ${value.linkedInProfileUserModel!.skills![index]}"),
                //             ],
                //           );
                //         }),

                // value.linkedInProfileUserModel!.projects!.length == 0
                //     ? SizedBox()
                //     : Text(
                //         "Projects",
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                // value.linkedInProfileUserModel!.projects!.length == 0
                //     ? SizedBox()
                //     : ListView.builder(
                //         shrinkWrap: true,
                //         physics: NeverScrollableScrollPhysics(),
                //         itemCount:
                //             value.linkedInProfileUserModel!.projects!.length,
                //         itemBuilder: (context, index) {
                //           return Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Text(
                //                 "${index + 1} : ${value.linkedInProfileUserModel!.projects![index].title}",
                //                 style: TextStyle(fontWeight: FontWeight.bold),
                //               ),
                //               Text(
                //                   "Start ${value.linkedInProfileUserModel!.projects![index].date!.start!.month},${value.linkedInProfileUserModel!.projects![index].date!.start!.year}  End ${value.linkedInProfileUserModel!.projects![index].date!.end!.month},${value.linkedInProfileUserModel!.projects![index].date!.end!.year}"),
                //               RichText(
                //                 text: TextSpan(
                //                   text: 'Description : ',
                //                   style: TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.black,
                //                   ),
                //                   children: <TextSpan>[
                //                     TextSpan(
                //                         text:
                //                             '${value.linkedInProfileUserModel!.projects![index].description}',
                //                         style: TextStyle(
                //                           color: Colors.black,
                //                           fontWeight: FontWeight.w400,
                //                         )),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           );
                //         })
              ],
            ),
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () async {
            await SMDP.mupdatecheckLinkedInModel(widget.username);
            if (SMDP.checkLinkedInModel.length == 1) {
              ErrorFlushbar(
                  context, "LinkedIn", "This user have already added");
            } else {
              await SMDP.mUpdateLinkedIn(
                "${value.linkedInProfileUserModel!.profilePicture}",
                "${value.linkedInProfileUserModel!.firstName} ${value.linkedInProfileUserModel!.lastName}",
                "${widget.username}",
              );
              SuccessFlushbar(
                  context, "LinkedIn", "LinkedIn Data Add Successfully");
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
