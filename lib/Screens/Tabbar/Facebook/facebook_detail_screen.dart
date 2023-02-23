import 'package:easymobile/Provider/SocialMediaDatabaseProvider.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/flush_bar.dart';
import '../../../Widgets/list_tile.dart';

class FacebookDetailScreen extends StatefulWidget {
  FacebookDetailScreen({Key? key, required this.id}) : super(key: key);
  String id;
  @override
  State<FacebookDetailScreen> createState() => _FacebookDetailScreenState();
}

class _FacebookDetailScreenState extends State<FacebookDetailScreen> {
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
                                    child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            "${value.facebookProfileUserModel!.picture.data.url}")),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${value.facebookProfileUserModel!.name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  width: width * 0.7,
                                  child: Text(
                                    "${value.facebookProfileUserModel!.id}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12),
                                  ),
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
                 SizedBox(height: 20,),
              userTile(
                  context: context,
                  title: "Go to Website",
                  onTap: () async {
                         launchUrl(Uri.parse(
                              "https://web.facebook.com/${widget.id}"));
                  }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () async {
            await SMDP.mGetCheckFacebook(widget.id);
            if (SMDP.CheckFacebookModel.length == 1) {
              ErrorFlushbar(
                  context, "Facebook", "This user have already added");
            } else {
              await SMDP.mUpdateFacebook(
                value.facebookProfileUserModel!.picture.data.url,
                "${value.facebookProfileUserModel!.name}",
                "${widget.id}",
              );
              SuccessFlushbar(
                  context, "Facebook", "Facebook Data Add Successfully");
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
