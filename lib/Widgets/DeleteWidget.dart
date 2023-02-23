import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Provider/SocialMediaDatabaseProvider.dart';
import 'package:easymobile/Screens/Bottom%20Navbar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

deleteInstagramUser(
  BuildContext context,
  String id,
) {
  Widget okButton = MaterialButton(
    color: Colors.red,
    child: Text("Yes"),
    onPressed: () async {
      await Provider.of<SocialMediaDatabaseProvider>(context, listen: false)
          .mDeleteInstagram(id);
    },
  );
  Widget cancelButtion = MaterialButton(
    color: Colors.green,
    child: Text("Cancel"),
    onPressed: () {
    },
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Sure to Cancel',
            style: TextStyle(color: primaryClr, fontWeight: FontWeight.w500),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Are you sure you want to Delete this User?'),
            ],
          ),
          actions: [okButton, cancelButtion],
        );
      });
}
