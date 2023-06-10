import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyfitness/body/profil/privacy_policy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'edit_profile.dart';

class Profil extends StatefulWidget {
  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  String firstName = '';
  String lastName = '';
  String dateSignedUp = '';
  String relativeTime = '';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      final usersRef = _firestore.collection('Users');
      final querySnapshot =
          await usersRef.where('userId', isEqualTo: userId).get();

      if (querySnapshot.size > 0) {
        final documentSnapshot = querySnapshot.docs.first;
        final data = documentSnapshot.data();

        setState(() {
          firstName = data['first name'] ?? '';
          lastName = data['last name'] ?? '';
          dateSignedUp = data['dateSignedUp'] ?? '';
          // Convert "dateSignedUp" to a DateTime object
          DateTime dateTime = DateTime.parse(dateSignedUp);
          // Calculate relative time using timeago
          relativeTime = timeago.format(dateTime, locale: 'en_short');
        });
      } else {
        print('User document not found!');
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushNamed('LoginSignup');
    } on FirebaseAuthException catch (error) {
      print("Error $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(left: 30, top: 10, right: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 50),
            IntrinsicHeight(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 65,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: const Image(
                              image: AssetImage("assets/images/user.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Container(
                    height: 100,
                    child: VerticalDivider(
                      color: Colors.grey[700],
                      thickness: 0.2,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Joined",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          '$relativeTime ago',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                '$firstName'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                '$lastName'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ProfileMenuWidget(
              title: "Edit Profile",
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditProfile(),
                ));
              },
              endIcon: true,
              textColor: Colors.white,
            ),
            ProfileMenuWidget(
              title: "Privacy Policy",
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PrivacyPolicy(),
                ));
              },
              endIcon: true,
              textColor: Colors.white,
            ),
            ProfileMenuWidget(
              title: "Sign out",
              onPress: () {
                signOut();
              },
              endIcon: false,
              textColor: Colors.red,
            ),
            SizedBox(
              height: 80,
            ),
          ]),
        )));
  }
}

class SizedDivider extends StatelessWidget {
  const SizedDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      child: Divider(
        color: Colors.lightGreenAccent,
        height: 10,
        indent: 10,
        endIndent: 10,
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white12,
          ),
        ),
      ),
      child: Center(
        child: ListTile(
          onTap: onPress,
          title: Text(
            title,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.normal, fontSize: 16),
          ),
          trailing: endIcon
              ? Container(
                  width: 30,
                  height: 30,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
