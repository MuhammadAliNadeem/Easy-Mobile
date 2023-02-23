import 'dart:async';
import 'dart:convert' as convert;
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easymobile/Constants/API_Keys.dart';
import 'package:easymobile/Models/InstagramUserModel.dart';
import 'package:easymobile/Screens/Auth/login_screen.dart';
import 'package:easymobile/Screens/Bottom%20Navbar/navigation_bar.dart';
import 'package:easymobile/Widgets/flush_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/FacebookUserModel.dart';
import '../Models/InstagramFollowersUserModel.dart';
import '../Models/InstagramReelsUserModel.dart';
import '../Models/LinkedInProfileUserModel.dart';
import '../Models/SnapChatProfileUserModel.dart';
import '../Models/UserModel.dart';
import '../Models/nstagramFollowingsUserModel.dart';
import '../Widgets/sharedperference.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  dynamic user;
  Timer? timer;
  bool isUserCreated = false;
  String userRegisterationMessage = "";
  bool isUserLoggedIn = false;
  bool isUserUpdated = false;
  String userLoginMessage = "";
  Future<void> createUser({
    required String email,
    required String userName,
    required String phone,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel model = UserModel(
        email: email,
        userName: userName,
        phone: phone,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      );

      await firestore.collection("Users").doc(email).set(model.SignupToMap());
      isUserCreated = true;
      userRegisterationMessage = "Sign up Successfull";
      notifyListeners();
      print(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        userRegisterationMessage = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        userRegisterationMessage = "The account already exists for that email.";
      }
      isUserCreated = false;
      notifyListeners();
    } catch (e) {
      isUserCreated = false;
      userRegisterationMessage = "Something went wrong";
      notifyListeners();
      print(e);
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.uid);
      Shared.pref.setString("email", email);
      isUserLoggedIn = true;
      userLoginMessage = "Welcome.! Sign in Successfull";
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        userLoginMessage = "No user found for that email..!";
        isUserLoggedIn = false;
        notifyListeners();
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        userLoginMessage = "Wrong password provided for that user..!";
        isUserLoggedIn = false;
        notifyListeners();
      } else {
        userLoginMessage = "Something went wrong..!";
        isUserLoggedIn = false;
        notifyListeners();
      }
    }
  }
//====================================== Email verification Function ===============================

  Future mverifyEmail(BuildContext context) async {
    try {
      user = firebaseAuth.currentUser;
      user.sendEmailVerification();
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        mcheckEmailVerified(context);
      });
    } catch (e) {
      ErrorFlushbar(context, "Error", "${e.toString()}");
    }
  }

  bool isEmailVerified = false;

  Future<void> mcheckEmailVerified(BuildContext context) async {
    user = firebaseAuth.currentUser;
    await user!.reload();
    if (user!.emailVerified) {
      timer!.cancel();
      isEmailVerified = true;
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  UserModel? userModel;
  TextEditingController username = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController phone = TextEditingController();
  mGetUser() async {
    UserModel? userModel;
    String? email = Shared.pref.getString("email");
    await firestore
        .collection("Users")
        .doc(email)
        .get()
        .then((value) => userModel = UserModel.fromJson(value.data()!));
    username = TextEditingController(text: userModel!.userName);
    useremail = TextEditingController(text: userModel!.email!);
    phone = TextEditingController(text: userModel!.phone!);
    this.userModel = userModel;
    notifyListeners();
  }

  Future<void> updateUser(
    String userName,
    String email,
    String phone,
  ) async {
    try {
      UserModel model = UserModel(
        userName: userName,
        email: email,
        phone: phone,
      );
      print('1');
      print(email);
      await firestore
          .collection("Users")
          .doc(email)
          .update(model.userUpdateToMap());
      print('2');
      isUserUpdated = true;
      mGetUser();
      notifyListeners();
    } catch (e) {
      print(e);
      isUserUpdated = false;
      notifyListeners();
    }
  }

  InstagramUserModel? instagramUserModel;
  String testtomanyInstagram = "";
  String checkInstgaram = "yes";
  mUpdateinstagramUserName(String username) async {
    InstagramUserModel? instagramUserModel;

    var headers = {
      'X-RapidAPI-Key': InstagramKey,
      'X-RapidAPI-Host': 'instagram-data1.p.rapidapi.com'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://instagram-data1.p.rapidapi.com/user/info?username=$username'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      checkInstgaram = "yes";
      print(value);
      // print("test");
      instagramUserModel = instagramUserModelFromJson(value);
      this.instagramUserModel = instagramUserModel;
      notifyListeners();
    } else {
      checkInstgaram = "no";
      // print("check to many");
      testtomanyInstagram = "Too Many Requests";
      notifyListeners();
      // print(response.reasonPhrase);
    }
  }

  InstagramFollowersUserModel? instagramFollowersUserModel;
  mUpdateInstagramFollowers(String username) async {
    InstagramFollowersUserModel? instagramFollowersUserModel;

    var headers = {
      'X-RapidAPI-Key': InstagramKey,
      'X-RapidAPI-Host': 'instagram-data1.p.rapidapi.com'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://instagram-data1.p.rapidapi.com/followers?username=$username'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      instagramFollowersUserModel = instagramFollowersUserModelFromJson(value);
      this.instagramFollowersUserModel = instagramFollowersUserModel;
      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }

  InstagramFollowingsUserModel? instagramFollowingsUserModel;
  mUpdateInstagramFollowing(String username) async {
    InstagramFollowingsUserModel? instagramFollowingsUserModel;

    var headers = {
      'X-RapidAPI-Key': InstagramKey,
      'X-RapidAPI-Host': 'instagram-data1.p.rapidapi.com'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://instagram-data1.p.rapidapi.com/followings?username=$username'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      instagramFollowingsUserModel =
          instagramFollowingsUserModelFromJson(value);
      this.instagramFollowingsUserModel = instagramFollowingsUserModel;
      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }

  mUpdateInstagramStories(String username) async {
    InstagramFollowingsUserModel? instagramFollowingsUserModel;

    var headers = {
      'X-RapidAPI-Key': InstagramKey,
      'X-RapidAPI-Host': 'instagram-data1.p.rapidapi.com'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://instagram-data1.p.rapidapi.com/user/stories?username=$username'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      instagramFollowingsUserModel =
          instagramFollowingsUserModelFromJson(value);
      this.instagramFollowingsUserModel = instagramFollowingsUserModel;
      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }

  bool CheckinstagramReelsUserModel = false;
  InstagramReelsUserModel? instagramReelsUserModel;

  mUpdateInstagramReels(String username) async {
    InstagramReelsUserModel? instagramReelsUserModel;

    var headers = {
      'X-RapidAPI-Key': InstagramKey,
      'X-RapidAPI-Host': 'instagram-data1.p.rapidapi.com'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://instagram-data1.p.rapidapi.com/user/reels?username=$username&limit=10'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      instagramReelsUserModel = instagramReelsUserModelFromJson(value);
      this.instagramReelsUserModel = instagramReelsUserModel;
      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }

  LinkedInProfileUserModel? linkedInProfileUserModel;
  String testtomanyLinkedIn = '';
  mUpdateLinkedInProfile(String username) async {
    LinkedInProfileUserModel? linkedInProfileUserModel;
    print("object");
    var headers = {
      'content-type': 'application/json',
      'X-RapidAPI-Key': LinkedInKey
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://linkedin-profiles-and-company-data.p.rapidapi.com/profile-details'));
    request.body = json.encode({
      "profile_id": "$username",
      "profile_type": "personal",
      "contact_info": false,
      "recommendations": false,
      "related_profiles": false
    });
    request.headers.addAll(headers);
    print("object1");

    http.StreamedResponse response = await request.send();
    print("object2");

    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      linkedInProfileUserModel = linkedInProfileUserModelFromJson(value);
      this.linkedInProfileUserModel = linkedInProfileUserModel;
    print("object3");
      notifyListeners();
    } else {
      print(response.reasonPhrase);
      testtomanyLinkedIn = "Too Many Requests";
    print("object4");
      notifyListeners();
    }
  }

  String testtomanyWhatsapp = '';
  String WhatsAppProfileImage = '';
  mUpdateWhatsAppProfileImage(String number) async {
    var headers = {
      'X-RapidAPI-Key': WhatsAppKey,
      'X-RapidAPI-Host': 'whatsapp-profile-pic.p.rapidapi.com'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://whatsapp-profile-pic.p.rapidapi.com/wspic/url?phone=$number'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      WhatsAppProfileImage = await response.stream.bytesToString();
      notifyListeners();
      // print(await response.stream.bytesToString());
    } else {
      testtomanyWhatsapp = 'Too Many Requests';
      notifyListeners();
    }
  }

  String WhatsAppProfileAbout = '';
  mUpdateWhatsAppProfileAbout(String number) async {
    var headers = {
      'X-RapidAPI-Key': WhatsAppKey,
      'X-RapidAPI-Host': 'whatsapp-profile-pic.p.rapidapi.com'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://whatsapp-profile-pic.p.rapidapi.com/about?phone=$number'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      Map<String, dynamic> check = json.decode(value);
      WhatsAppProfileAbout = check["about"];
      notifyListeners();
      // print(await response.stream.bytesToString());
    } else {
      testtomanyWhatsapp = 'Too Many Requests';
      notifyListeners();
    }
  }

  String WhatsAppValidation = "false";
  mUpdateWhatsAppValidation(String number) async {
    var headers = {
      'X-RapidAPI-Key': WhatsAppKey,
      'X-RapidAPI-Host': 'whatsapp-profile-pic.p.rapidapi.com'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://whatsapp-profile-pic.p.rapidapi.com/wchk?phone=$number'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print("object1");
    if (response.statusCode == 200) {
      WhatsAppValidation = await response.stream.bytesToString();
      // Map<String, dynamic> check = json.decode(value);
      // WhatsAppProfileAbout = check["about"];
      // WhatsAppValidation = value as bool;
      // WhatsAppValidation = "true";
      print("object2");
      notifyListeners();
      // print(await response.stream.bytesToString());
    } else {
      print("object3");
      WhatsAppValidation = "false";
      testtomanyWhatsapp = 'Too Many Requests';
      notifyListeners();
    }
  }

  String testtomanySnapchat = '';
  SnapChatProfileUserModel? snapChatProfileUserModel;
  mUpdateSNapChatProfile(String username) async {
    SnapChatProfileUserModel? snapChatProfileUserModel;

    var headers = {
      'X-RapidAPI-Key': SnapChatKey,
      'X-RapidAPI-Host': 'snapchat-profile-scraper-api.p.rapidapi.com'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://snapchat-profile-scraper-api.p.rapidapi.com/profile?username=$username'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      snapChatProfileUserModel = snapChatProfileUserModelFromJson(value);
      this.snapChatProfileUserModel = snapChatProfileUserModel;
      notifyListeners();
    } else {
      testtomanySnapchat = "Too Many Requests";
      notifyListeners();
    }
  }

  FacebookProfileUserModel? facebookProfileUserModel;
  String errorFaceBook = "";
  mGetUserFacebookData(String id) async {
    FacebookProfileUserModel? facebookProfileUserModel;
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://graph.facebook.com/$id/?fields=id,name,picture&access_token=938878370819910|uyb0ZUeES5noVDTTuircUMCndSM'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      facebookProfileUserModel = facebookProfileUserModelFromJson(value);
      this.facebookProfileUserModel = facebookProfileUserModel;
      errorFaceBook = "";
      notifyListeners();
    } else {
      errorFaceBook = "No User Found";
      notifyListeners();
      print(response.reasonPhrase);
    }
  }
  //=================================== Logout Function ================================

  mlogoutUser(BuildContext context) {
    Shared.pref.remove("email");
    Shared.pref.clear();
    Timer(const Duration(milliseconds: 500), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen()),
          ModalRoute.withName('/'));
    });
  }
}
