import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Tabbar/Instagram/InstagramPlayer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/app_bar.dart';

class Instagram_Reels extends StatefulWidget {
  Instagram_Reels({super.key, required this.username});
  String username;

  @override
  State<Instagram_Reels> createState() => _Instagram_ReelsState();
}

class _Instagram_ReelsState extends State<Instagram_Reels> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context, listen: false)
        .mUpdateInstagramReels(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: appBar(title: "User Reels"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: value.instagramReelsUserModel!.items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoApp(
                                    url: value.instagramReelsUserModel!
                                        .items[index].videoVersions[0].url,
                                  )));
                    },
                    child: ListTile(
                      title: Text("${index+1} Reel"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
