import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyfitness/body/acceuil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';

import 'profil.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  String firstName = '';
  String lastName = '';
  String email = '';
  final _formKey = GlobalKey<FormState>();
  File? _profileImage;

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
          email = data['email'] ?? '';
        });

        print('First Name: $firstName');
        print('Last Name: $lastName');
        print('Email: $email');
      } else {
        print('User document not found!');
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

  Future<void> updateFieldValue(String fieldName, String value) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      final usersRef = _firestore.collection('Users');
      final querySnapshot =
          await usersRef.where('userId', isEqualTo: userId).get();

      if (querySnapshot.size > 0) {
        final documentSnapshot = querySnapshot.docs.first;
        final documentRef = _firestore.doc(documentSnapshot.reference.path);

        await documentRef.update({
          fieldName: value,
        });

        print('$fieldName updated successfully!');
      } else {
        print('User document not found!');
      }
    } catch (e) {
      print('Error updating $fieldName: $e');
    }
  }

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "EDIT PROFILE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0, left: 130),
                      child: SizedBox(
                        height: 90,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: _profileImage != null
                                ? Image.file(_profileImage!)
                                : Image.asset("assets/images/user.png")),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey[800],
                        ),
                        child: IconButton(
                          onPressed: pickImage,
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                SizedDivider(),
                ProfileMenuWidgetEdit(
                  title: "First name",
                  subtitle: firstName,
                  onPress: () => showNameDialogAlert(
                    context,
                    "first name",
                    (value) {
                      setState(() {
                        firstName = value;
                      });
                    },
                  ),
                  endIcon: false,
                  titleColor: Colors.lightGreenAccent,
                  subtitleColor: Colors.white,
                ),
                SizedDivider(),
                ProfileMenuWidgetEdit(
                  title: "Last name",
                  subtitle: lastName,
                  onPress: () => showNameDialogAlert(
                    context,
                    "last name",
                    (value) {
                      setState(() {
                        lastName = value;
                      });
                    },
                  ),
                  endIcon: false,
                  titleColor: Colors.lightGreenAccent,
                  subtitleColor: Colors.white,
                ),
                SizedDivider(),
                ProfileMenuWidgetEdit(
                  title: "Email",
                  subtitle: email,
                  onPress: () => showNameDialogAlert(
                    context,
                    "email",
                    (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  endIcon: false,
                  titleColor: Colors.lightGreenAccent,
                  subtitleColor: Colors.white,
                ),
                SizedDivider(),
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 80),
                  child: SizedBox(
                    height: 46,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.lightGreenAccent,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Acceuil(),
                        ));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 65,
                          ),
                          Text(
                            "Save",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showNameDialogAlert(
      BuildContext context, String fieldName, Function(String) onUpdate) async {
    final _controller = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    await showDialog(
      context: context,
      builder: (context) {
        _controller.text = getFieldFromFieldName(fieldName.toLowerCase());
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(
            "Update $fieldName",
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _controller,
                    cursorColor: Colors.lightGreen,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Enter $fieldName",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600),
                      ),
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightGreen),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field cannot be empty.";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String newValue = _controller.text.trim();
                  onUpdate(newValue);
                  updateFieldValue(fieldName,
                      newValue); // Add this line to update Firestore field
                  Navigator.pop(context);
                }
              },
              child: Text(
                "OK",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ],
        );
      },
    );
  }

  String getFieldFromFieldName(String fieldName) {
    switch (fieldName) {
      case "first name":
        return firstName;
      case "last name":
        return lastName;
      case "email":
        return email;
      default:
        return "";
    }
  }
}

class ProfileMenuWidgetEdit extends StatelessWidget {
  const ProfileMenuWidgetEdit({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPress,
    this.endIcon = true,
    this.titleColor,
    this.subtitleColor,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? titleColor;
  final Color? subtitleColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ListTile(
        onTap: onPress,
        title: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: subtitleColor,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
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
    );
  }
}
