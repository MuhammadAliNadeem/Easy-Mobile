import 'package:easymobile/Provider/SocialMediaDatabaseProvider.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/flush_bar.dart';

class WhatsappDetailScreen extends StatefulWidget {
  WhatsappDetailScreen({Key? key, required this.username}) : super(key: key);
  String username;
  @override
  State<WhatsappDetailScreen> createState() => _WhatsappDetailScreenState();
}

class _WhatsappDetailScreenState extends State<WhatsappDetailScreen> {
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
                                  height: 110,
                                  width: 110,
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
                                            "${value.WhatsAppProfileImage}")),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "+${widget.username}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${value.WhatsAppProfileAbout}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
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
                //       backgroundImage:
                //           NetworkImage("${value.WhatsAppProfileImage}")),
                //   title: Text("${value.WhatsAppProfileAbout} "),
                //   subtitle: Text("${widget.username}"),
                // ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () async {
            await SMDP.mGetCheckWhatsapp(widget.username);
            if (SMDP.CheckWhatsappModel.length==1) {
              
              ErrorFlushbar(
                  context, "Whatsapp", "This user have already added");
            } else {
               await SMDP.mUpdateWhatsapp(
              "${value.WhatsAppProfileImage}",
              "${value.WhatsAppProfileAbout}",
              "${widget.username}",
            );
            SuccessFlushbar(
                context, "Whatsapp", "Whatsapp Data Add Successfully");
         
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
