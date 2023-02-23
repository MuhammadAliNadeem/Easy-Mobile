import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Constants/paths.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Tabbar/Whatsapp.dart/whatsapp_detail_Screen.dart';
import 'package:easymobile/Widgets/buttons.dart';
import 'package:easymobile/Widgets/flush_bar.dart';
import 'package:easymobile/Widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../Provider/SocialMediaDatabaseProvider.dart';

class Whatsapp extends StatefulWidget {
  const Whatsapp({Key? key}) : super(key: key);

  @override
  State<Whatsapp> createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {
  TextEditingController Phoneno = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
        void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SocialMediaDatabaseProvider>(context, listen: false)
      .mGetWhatsapp ();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer2<AuthProvider,SocialMediaDatabaseProvider>(
      builder: (context, value, SMDP,child) => Scaffold(
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
                  child: whatsapp,
                ),
                const SizedBox(
                  height: 30,
                ),
                textField(
                  context: context,
                  lable: "Phone No",
                  hint: "Phone No",
                  icon: CupertinoIcons.person,
                  controller: Phoneno,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                loadingButton(
                    context: context,
                    onPressed: () async {
                      await value.mUpdateWhatsAppValidation(Phoneno.text);
                      if (value.testtomanyWhatsapp!="Too Many Requests") {
                         if (value.WhatsAppValidation == "true") {
                        await value.mUpdateWhatsAppProfileImage(Phoneno.text);
                        await value.mUpdateWhatsAppProfileAbout(Phoneno.text);
                        _btnController.success();
                        Timer(const Duration(milliseconds: 700), () {
                          _btnController.reset();
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: WhatsappDetailScreen(
                              username: Phoneno.text,
                            ),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        });
                      } else {
                        _btnController.success();
                        ErrorFlushbar(context, "Whatsapp", "No whatsapp number");
                        Timer(const Duration(seconds: 2), () {
                          _btnController.reset();
                        });
                      }
                      } else {
                         _btnController.success();
                        ErrorFlushbar(context, "Whatsapp", "Please Change the Api key thank you....!!!");
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
                    itemCount: SMDP.WhatsappModel.length,
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
                                    SMDP.WhatsappModel[index].imageUrl!)),
                            title: Text(
                              "${SMDP.WhatsappModel[index].about!} ",
                              style: TextStyle(fontSize: 14),
                            ),
                            subtitle: Text(
                              "${SMDP.WhatsappModel[index].userName!}",
                              style: TextStyle(fontSize: 11),
                            ),
                            onTap: () {
                              // launchUrl(Uri.parse(
                              //     "https://www.Whatsapp.com/add/${SMDP.WhatsappModel[index].userName}?share_id=wlC--D_D9K0&locale=en-GB"));
                            },
                            trailing: IconButton(
                                onPressed: () {
                                  SMDP.mDeleteWhatsapp(
                                      SMDP.WhatsappModel[index].id!);
                                  // deleteInstagramUser(
                                  //     context, SMDP.instagramModel[index].id!);
                                },
                                icon: Icon(Icons.remove_circle,color: Colors.red,)),
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
