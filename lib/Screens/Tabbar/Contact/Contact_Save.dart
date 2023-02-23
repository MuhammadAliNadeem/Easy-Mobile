import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Constants/paths.dart';
import 'package:easymobile/Provider/SocialMediaDatabaseProvider.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Profile/edit_profile_screen.dart';
import 'package:easymobile/Screens/Settings/settings_screen.dart';
import 'package:easymobile/Widgets/app_bar.dart';
import 'package:easymobile/Widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SaveContactScreen extends StatefulWidget {
  const SaveContactScreen({Key? key}) : super(key: key);

  @override
  State<SaveContactScreen> createState() => _SaveContactScreenState();
}

class _SaveContactScreenState extends State<SaveContactScreen> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).mGetUser();
    Provider.of<SocialMediaDatabaseProvider>(context, listen: false)
        .mGetContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer2<AuthProvider, SocialMediaDatabaseProvider>(
      builder: (context, value, SMDP, child) => Scaffold(
        appBar: appBar(title: "Contacts"),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                        color: primaryClr,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: profile,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${value.userModel!.userName}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                "${value.userModel!.email}",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 13),
                              ),
                              Text(
                                "${value.userModel!.phone}",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: SMDP.ContactModel.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Stack(
                          children: [
                            Card(
                              margin: EdgeInsets.zero,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  leading: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: contactImg),
                                  title: Text(
                                    "${SMDP.ContactModel[index].name!} ",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  subtitle: Text(
                                    "${SMDP.ContactModel[index].phoneNo!}",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                  onTap: () {
                                    launch(
                                        'tel: ${SMDP.ContactModel[index].phoneNo!}');
                                  },
                                  trailing: IconButton(
                                      onPressed: () {
                                        SMDP.mDeleteContact(
                                            SMDP.ContactModel[index].id!);
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
                            // Positioned(
                            //   top: 0,
                            //   right: 0,
                            //   child: Container(
                            //     width: 80,
                            //     height: 71,
                            //     decoration: BoxDecoration(
                            //         color: primaryClr.withOpacity(0.15),
                            //         borderRadius: BorderRadius.only(
                            //           topRight: Radius.circular(8),
                            //           bottomRight: Radius.circular(8),
                            //           bottomLeft: Radius.circular(45),
                            //         )),
                            //   ),
                            // )
                          ],
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
