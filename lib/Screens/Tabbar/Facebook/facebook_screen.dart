import 'dart:async';
import 'package:easymobile/Constants/paths.dart';
import 'package:easymobile/Provider/SocialMediaDatabaseProvider.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Tabbar/Facebook/facebook_detail_screen.dart';
import 'package:easymobile/Widgets/buttons.dart';
import 'package:easymobile/Widgets/flush_bar.dart';
import 'package:easymobile/Widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:url_launcher/url_launcher.dart';

class FacebookScreen extends StatefulWidget {
  const FacebookScreen({Key? key}) : super(key: key);

  @override
  State<FacebookScreen> createState() => _FacebookScreenState();
}

class _FacebookScreenState extends State<FacebookScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SocialMediaDatabaseProvider>(context, listen: false)
        .mGetFacebook();
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
                child: facebook,
              ),
              const SizedBox(
                height: 30,
              ),
              textField(
                context: context,
                lable: "Facebook id",
                hint: "Facebook id",
                icon: CupertinoIcons.person,
                controller: email,
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              loadingButton(
                  context: context,
                  onPressed: () async {
                    await value.mGetUserFacebookData(email.text);
                    if (value.errorFaceBook == "") {
                      Timer(const Duration(milliseconds: 700), () {
                        _btnController.reset();
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: FacebookDetailScreen(
                            id: email.text,
                          ),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      });
                    } else {
                      _btnController.error();
                      ErrorFlushbar(context, "Facebook",
                          "No User Found please check your id...!!");
                      Timer(Duration(seconds: 2), () {
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
                itemCount: SMDP.FacebookModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                                SMDP.FacebookModel[index].imageUrl!)),
                        title: Text(
                          "${SMDP.FacebookModel[index].name!} ",
                          style: TextStyle(fontSize: 14),
                        ),
                        subtitle: Text(
                          "${SMDP.FacebookModel[index].userName!}",
                          style: TextStyle(fontSize: 11),
                        ),
                        onTap: ()async {
                           await value.mGetUserFacebookData(email.text);
                    if (value.errorFaceBook == "") {
                      Timer(const Duration(milliseconds: 700), () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: FacebookDetailScreen(
                            id: email.text,
                          ),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      });
                    } else {
                      ErrorFlushbar(context, "Facebook",
                          "No User Found please check your id...!!");
                     
                    }
                     
                        },
                        trailing: IconButton(
                            onPressed: () async {
                              await SMDP.mDeleteFacebook(
                                  SMDP.FacebookModel[index].id!);
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
                },
              ),
            ],
          ),
        ),
      )
          // FutureBuilder(
          //   /// Get All post urls
          //   future: ipa.getAllPosts(),
          //   builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          //     /// Wait Until data loads
          //     // print("${snapshot.error}");
          //     if (!snapshot.hasData)
          //       return Center(
          //           child: CircularProgressIndicator(
          //         color: primaryClr,
          //       ));

          //     /// List of Post
          //     List<Post> posts = snapshot.data!;

          //     return ListView(children: [
          //       const SizedBox(height: 20),
          //       FutureBuilder(
          //         future: ipa.getBasicInfo(),
          //         builder:
          //             (BuildContext context, AsyncSnapshot<BasicInfo> snapshot) {
          //           final info = snapshot.data;
          //           if (!snapshot.hasData)
          //             return Center(
          //                 child: CircularProgressIndicator(
          //               color: primaryClr,
          //             ));

          //           return Column(
          //             children: [
          //               makeText('${info!.fullName}'),
          //               SizedBox(height: 10),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   ClipRRect(
          //                       borderRadius: BorderRadius.circular(50),
          //                       child:
          //                           Image.network(info.profilePic!, height: 100)),
          //                   makeText('Posts\n${info.noOfPosts}'),
          //                   makeText('Followers\n${info.followers}'),
          //                   makeText('Following\n${info.following}'),
          //                 ],
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //       ...posts
          //           .map(
          //             (p) => Column(
          //               children: [
          //                 Container(
          //                   padding: EdgeInsets.all(10),
          //                   child: Container(
          //                     height: 450,
          //                     padding: EdgeInsets.symmetric(vertical: 10),
          //                     child: ListView(
          //                         scrollDirection: Axis.horizontal,
          //                         children: p.hasNestedImages!
          //                             ? [
          //                                 ...p.images!
          //                                     .map(
          //                                       (i) => Container(
          //                                         padding: EdgeInsets.symmetric(
          //                                             vertical: 10),
          //                                         child: ClipRRect(
          //                                           child: Image.network(
          //                                             i.displayUrl!,
          //                                             fit: BoxFit.cover,
          //                                           ),
          //                                           borderRadius: p.images!.first ==
          //                                                   i
          //                                               ? BorderRadius.only(
          //                                                   topLeft:
          //                                                       Radius.circular(10),
          //                                                   bottomLeft:
          //                                                       Radius.circular(10),
          //                                                 )
          //                                               : p.images!.last == i
          //                                                   ? BorderRadius.only(
          //                                                       topRight:
          //                                                           Radius.circular(
          //                                                               10),
          //                                                       bottomRight:
          //                                                           Radius.circular(
          //                                                               10),
          //                                                     )
          //                                                   : BorderRadius.all(
          //                                                       Radius.zero),
          //                                         ),
          //                                       ),
          //                                     )
          //                                     .toList()
          //                               ]
          //                             : [
          //                                 ClipRRect(
          //                                     child: Image.network(p.displayUrl!,
          //                                         fit: BoxFit.cover),
          //                                     borderRadius:
          //                                         BorderRadius.circular(10)),
          //                               ]),
          //                   ),
          //                 ),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Icon(
          //                       Icons.favorite_border_rounded,
          //                       color: Colors.red,
          //                     ),
          //                     makeText(' ${p.likes}'),
          //                     SizedBox(width: 10),
          //                     Icon(
          //                       Icons.comment,
          //                       color: Colors.blue,
          //                     ),
          //                     makeText(' ${p.comments}'),
          //                   ],
          //                 ),
          //                 SizedBox(height: 20),
          //                 makeText('${p.caption}')
          //               ],
          //             ),
          //           )
          //           .toList()
          //     ]);
          //   },
          // ),
          ),
    );
  }
}
