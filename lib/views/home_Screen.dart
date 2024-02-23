import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kevin_assignment/constants/image_constants.dart';
import 'package:kevin_assignment/helppers/notification_helper.dart';
import 'package:kevin_assignment/helppers/response_model/user_model.dart';
import 'package:get/get.dart';
import 'package:kevin_assignment/views/splash_page.dart';

class HomeScreen extends StatelessWidget {
  var firebaseAuth = FirebaseAuth.instance;

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  IMAGES.bgImage,
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(firebaseAuth.currentUser?.uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                print(jsonEncode(snapshot.data?.data()));
                Usermodel usermodel =
                    Usermodel.fromJson(snapshot.data?.data() ?? {});
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5)),
                      child: Text(
                        "Hello Mr ${usermodel.fName} ${usermodel.lName}",
                        textAlign: TextAlign.center,
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await firebaseAuth.signOut();
                        Get.offAll(const SplashPage());
                      },
                      child: const Text("Sign out"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        NotificationHelper().sendNotification();
                      },
                      child: const Text("Send Notification"),
                    )
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return const Text("Error");
            },
          ),
        ),
      ),
    );
  }
}
