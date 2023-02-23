import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easymobile/Models/InstagramDatabaseModel.dart';
import 'package:easymobile/Models/LinkedInDatabaseModel.dart';
import 'package:easymobile/Widgets/sharedperference.dart';
import 'package:flutter/material.dart';

import '../Models/ContactDatabaseMdoel.dart';
import '../Models/FacebookDatabaseModel.dart';
import '../Models/SnapChatDatabaseModel.dart';
import '../Models/WhatsappDatabaseModel.dart';

class SocialMediaDatabaseProvider with ChangeNotifier {
  final firestore = FirebaseFirestore.instance;
  mUpdateInstagram(
    String imageUrl,
    String name,
    String userName,
    int followers,
    int followings,
  ) async {
    String? email = Shared.pref.getString("email");
    DocumentReference reference = firestore.collection("Instagram").doc();
    String id = reference.id;
    InstagramDatabaseModel model = InstagramDatabaseModel(
      imageUrl: imageUrl,
      name: name,
      userName: userName,
      id: id,
      email: email,
      followers: followers,
      followings: followings,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    await firestore.collection("Instagram").doc(id).set(model.instgramToMap());
    await mGetInstagram();
    notifyListeners();
  }

  List<InstagramDatabaseModel> instagramModel = [];
  mGetInstagram() async {
    String? email = Shared.pref.getString("email");
    List<InstagramDatabaseModel> instagramModel = [];
    await firestore
        .collection("Instagram")
        .where("email", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              instagramModel
                  .add(InstagramDatabaseModel.fromJson(element.data()));
            }));
    this.instagramModel = instagramModel;
    notifyListeners();
  }

  List<InstagramDatabaseModel> CheckinstagramModel = [];
  mGetCheckInstagram(String username) async {
    String? email = Shared.pref.getString("email");
    List<InstagramDatabaseModel> CheckinstagramModel = [];
    await firestore
        .collection("Instagram")
        .where("userName", isEqualTo: username)
        .where("email", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              CheckinstagramModel.add(
                  InstagramDatabaseModel.fromJson(element.data()));
            }));
    this.CheckinstagramModel = CheckinstagramModel;
    notifyListeners();
  }

  mDeleteInstagram(String id) async {
    await firestore.collection("Instagram").doc(id).delete();
    await mGetInstagram();
    notifyListeners();
  }

  mUpdateLinkedIn(
    String imageUrl,
    String name,
    String userName,
  ) async {
    String? email = Shared.pref.getString("email");
    DocumentReference reference = firestore.collection("LinkedIn").doc();
    String id = reference.id;
    LinkedInDatabaseModel model = LinkedInDatabaseModel(
      imageUrl: imageUrl,
      name: name,
      userName: userName,
      id: id,
      email: email,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    await firestore.collection("LinkedIn").doc(id).set(model.instgramToMap());
    await mGetLinkedIn();
    notifyListeners();
  }

  List<LinkedInDatabaseModel> checkLinkedInModel = [];
  mupdatecheckLinkedInModel(String username) async {
    List<LinkedInDatabaseModel> checkLinkedInModel = [];
    String? email = Shared.pref.getString("email");
    await firestore
        .collection("LinkedIn")
        .where("userName", isEqualTo: username)
        .where("email", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              checkLinkedInModel
                  .add(LinkedInDatabaseModel.fromJson(element.data()));
            }));
    this.checkLinkedInModel = checkLinkedInModel;
    notifyListeners();
  }

  List<LinkedInDatabaseModel> LinkedInModel = [];
  mGetLinkedIn() async {
    String? email = Shared.pref.getString("email");
    List<LinkedInDatabaseModel> LinkedInModel = [];
    await firestore
        .collection("LinkedIn")
        .where("email", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              LinkedInModel.add(LinkedInDatabaseModel.fromJson(element.data()));
            }));
    this.LinkedInModel = LinkedInModel;
    notifyListeners();
  }

  mDeleteLinkedIn(String id) async {
    await firestore.collection("LinkedIn").doc(id).delete();
    await mGetLinkedIn();
    notifyListeners();
  }

  mUpdateSnapChat(
    String imageUrl,
    String name,
    String userName,
  ) async {
    String? email = Shared.pref.getString("email");
    DocumentReference reference = firestore.collection("SnapChat").doc();
    String id = reference.id;
    SnapChatDatabaseModel model = SnapChatDatabaseModel(
      imageUrl: imageUrl,
      name: name,
      userName: userName,
      id: id,
      email: email,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    await firestore.collection("SnapChat").doc(id).set(model.instgramToMap());
    await mGetSnapChat();
    notifyListeners();
  }

  List<SnapChatDatabaseModel> SnapChatModel = [];
  mGetSnapChat() async {
    String? email = Shared.pref.getString("email");
    List<SnapChatDatabaseModel> SnapChatModel = [];
    await firestore
        .collection("SnapChat")
        .where("email", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              SnapChatModel.add(SnapChatDatabaseModel.fromJson(element.data()));
            }));
    this.SnapChatModel = SnapChatModel;
    notifyListeners();
  }

  List<SnapChatDatabaseModel> CheckSnapChatModel = [];
  mGetCheckSnapChat(String username) async {
    String? email = Shared.pref.getString("email");
    List<SnapChatDatabaseModel> CheckSnapChatModel = [];
    await firestore
        .collection("SnapChat")
        .where("userName", isEqualTo: username)
        .where("email", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              CheckSnapChatModel.add(
                  SnapChatDatabaseModel.fromJson(element.data()));
            }));
    this.CheckSnapChatModel = CheckSnapChatModel;
    notifyListeners();
  }

  mDeleteSnapChat(String id) async {
    await firestore.collection("SnapChat").doc(id).delete();
    await mGetSnapChat();
    notifyListeners();
  }

  mUpdateWhatsapp(
    String imageUrl,
    String about,
    String userName,
  ) async {
    String? email = Shared.pref.getString("email");
    DocumentReference reference = firestore.collection("Whatsapp").doc();
    String id = reference.id;
    WhatsappDatabaseModel model = WhatsappDatabaseModel(
      imageUrl: imageUrl,
      about: about,
      userName: userName,
      id: id,
      email: email,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    await firestore.collection("Whatsapp").doc(id).set(model.instgramToMap());
    await mGetWhatsapp();
    notifyListeners();
  }

  List<WhatsappDatabaseModel> WhatsappModel = [];
  mGetWhatsapp() async {
    String? email = Shared.pref.getString("email");
    List<WhatsappDatabaseModel> WhatsappModel = [];
    await firestore
        .collection("Whatsapp")
        .where("email", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              WhatsappModel.add(WhatsappDatabaseModel.fromJson(element.data()));
            }));
    this.WhatsappModel = WhatsappModel;
    notifyListeners();
  }

  List<WhatsappDatabaseModel> CheckWhatsappModel = [];
  mGetCheckWhatsapp(String username) async {
    String? email = Shared.pref.getString("email");
    List<WhatsappDatabaseModel> CheckWhatsappModel = [];
    await firestore
        .collection("Whatsapp")
        .where("userName", isEqualTo: username)
        .where("email", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              CheckWhatsappModel.add(
                  WhatsappDatabaseModel.fromJson(element.data()));
            }));
    this.CheckWhatsappModel = CheckWhatsappModel;
    notifyListeners();
  }

  mDeleteWhatsapp(String id) async {
    await firestore.collection("Whatsapp").doc(id).delete();
    await mGetWhatsapp();
    notifyListeners();
  }

  mUpdateContact(
    // String imageUrl,
    String name,
    String phoneNo,
  ) async {
    String? email = Shared.pref.getString("email");
    DocumentReference reference = firestore.collection("Contact").doc();
    String id = reference.id;
    ContactDatabaseModel model = ContactDatabaseModel(
      // imageUrl: imageUrl,
      name: name,
      phoneNo: phoneNo,
      id: id,
      email: email,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    await firestore.collection("Contact").doc(id).set(model.instgramToMap());
    await mGetContact();
    notifyListeners();
  }

  List<ContactDatabaseModel> ContactModel = [];
  mGetContact() async {
    String? email = Shared.pref.getString("email");
    List<ContactDatabaseModel> ContactModel = [];
    await firestore
        .collection("Contact")
        .where("email", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              ContactModel.add(ContactDatabaseModel.fromJson(element.data()));
            }));
    this.ContactModel = ContactModel;
    notifyListeners();
  }

  List<ContactDatabaseModel> CheckContactModel = [];
  mGetCheckContact(String phone) async {
    String? email = Shared.pref.getString("email");
    List<ContactDatabaseModel> CheckContactModel = [];
    await firestore
        .collection("Contact")
        .where("phoneNo", isEqualTo: phone)
        .where("email", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              CheckContactModel.add(
                  ContactDatabaseModel.fromJson(element.data()));
            }));
    this.CheckContactModel = CheckContactModel;
    notifyListeners();
  }

  mDeleteContact(String id) async {
    print("object");
    await firestore.collection("Contact").doc(id).delete();
    await mGetContact();
    notifyListeners();
  }









  
  mUpdateFacebook(
    String imageUrl,
    String name,
    String userName,
  ) async {
    String? email = Shared.pref.getString("email");
    DocumentReference reference = firestore.collection("Facebook").doc();
    String id = reference.id;
    FacebookDatabaseModel model = FacebookDatabaseModel(
      imageUrl: imageUrl,
      name: name,
      userName: userName,
      id: id,
      email: email,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    await firestore.collection("Facebook").doc(id).set(model.instgramToMap());
    await mGetFacebook();
    notifyListeners();
  }

  List<FacebookDatabaseModel> FacebookModel = [];
  mGetFacebook() async {
    String? email = Shared.pref.getString("email");
    List<FacebookDatabaseModel> FacebookModel = [];
    await firestore
        .collection("Facebook")
        .where("email", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              FacebookModel.add(FacebookDatabaseModel.fromJson(element.data()));
            }));
    this.FacebookModel = FacebookModel;
    notifyListeners();
  }

  List<FacebookDatabaseModel> CheckFacebookModel = [];
  mGetCheckFacebook(String phone) async {
    String? email = Shared.pref.getString("email");
    List<FacebookDatabaseModel> CheckFacebookModel = [];
    await firestore
        .collection("Facebook")
        .where("userName", isEqualTo: phone)
        .where("email", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              CheckFacebookModel.add(
                  FacebookDatabaseModel.fromJson(element.data()));
            }));
    this.CheckFacebookModel = CheckFacebookModel;
    notifyListeners();
  }

  mDeleteFacebook(String id) async {
    await firestore.collection("Facebook").doc(id).delete();
    await mGetFacebook();
    notifyListeners();
  }
}
