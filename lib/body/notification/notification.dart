import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {


  @override
  void initState() {
    super.initState();
    fetchBMI();
    fetchBMR();
  }


  final ScrollController _scrollController = ScrollController();
  final userId = FirebaseAuth.instance.currentUser?.uid;

  List<String> bmiTitles = [];
  List<String> bmiSubtitles = [];
  List<String> bmiTrailings = [];
  double bmi = 0.0;
  List<String> bmrTitles = [];
  List<String> bmrSubtitles = [];
  List<String> bmrTrailings = [];
  double bmr = 0.0;
  List<String> notificationTitles = [];
  List<String> notificationSubtitles = [];
  List<String> notificationTrailings = [];
  String activityLevel = '';

  Future<void> fetchBMR() async {
    try {
      final usersRef = FirebaseFirestore.instance.collection('Users');
      final querySnapshot =
          await usersRef.where('userId', isEqualTo: userId).get();

      if (querySnapshot.size > 0) {
        final documentSnapshot = querySnapshot.docs.first;
        final data = documentSnapshot.data();

        final bmrValue = data['bmr'] ?? '';
        final activityLevelValue = data['level'] ?? '';
        if (bmrValue != null) {
          bmr = bmrValue.toDouble(); // Convert to double
        }
        if (activityLevelValue != null) {
          activityLevel = activityLevelValue;
        }

        final double adjustedBMR = calculateAdjustedBMR(bmr, activityLevel);
        final formattedBMR = adjustedBMR.toStringAsFixed(2);

        final category = getBMRCategory(adjustedBMR);

        setState(() {
          bmrTitles.insert(0, 'BMR Notification');
          bmrSubtitles.insert(0,
              'Your BMR is $formattedBMR - $category'); // Customize the subtitle text as per your requirement
          final currentTime = DateTime.now();
          final formattedTime = '${currentTime.hour}:${currentTime.minute}';
          bmrTrailings.insert(0, formattedTime);
        });
      } else {
        print('User document not found!');
      }
    } catch (e) {
      print('Error fetching BMR: $e');
    }
  }

  Future<void> fetchBMI() async {
    try {
      final usersRef = FirebaseFirestore.instance.collection('Users');
      final querySnapshot =
          await usersRef.where('userId', isEqualTo: userId).get();

      if (querySnapshot.size > 0) {
        final documentSnapshot = querySnapshot.docs.first;
        final data = documentSnapshot.data();

        final bmiValue = data['bmi'] ?? '';
        if (bmiValue != null) {
          bmi = bmiValue.toDouble(); // Convert to double
        }
        final formattedBMI = bmi.toStringAsFixed(2);
        final category = getBMICategory(bmi);
        setState(() {
          bmiTitles.insert(0, 'BMI Notification');
          bmiSubtitles.insert(0,
              'Your BMI is $formattedBMI - $category'); // Customize the subtitle text as per your requirement
          final currentTime = DateTime.now();
          final formattedTime = '${currentTime.hour}:${currentTime.minute}';
          bmiTrailings.insert(0, formattedTime);
        });
      } else {
        print('User document not found!');
      }
    } catch (e) {
      print('Error fetching BMI: $e');
    }
  }


  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Insuffisance pondérale (maigreur)';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Corpulence normale';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Surpoids';
    } else if (bmi >= 30 && bmi < 35) {
      return 'Obésité modérée';
    } else if (bmi >= 35 && bmi < 40) {
      return 'Obésité sévère';
    } else {
      return 'Obésité morbide ou massive';
    }
  }

  String getBMRCategory(double bmr) {
    if (bmr < 1200) {
      return 'Very Low BMR';
    } else if (bmr >= 1200 && bmr < 1500) {
      return 'Low BMR';
    } else if (bmr >= 1500 && bmr < 1800) {
      return 'Moderate BMR';
    } else if (bmr >= 1800 && bmr < 2200) {
      return 'High BMR';
    } else {
      return 'Very High BMR';
    }
  }

  double calculateAdjustedBMR(double bmr, String activityLevel) {
    double adjustedBMR = bmr;

    switch (activityLevel) {
      case 'Sedentary - No exercise':
        adjustedBMR *= 1.2;
        break;
      case 'Lightly active - 1-3 days/week':
        adjustedBMR *= 1.375;
        break;
      case 'Moderately active - 3-5 days/week':
        adjustedBMR *= 1.55;
        break;
      case 'Very active - 6-7 days a week':
        adjustedBMR *= 1.725;
        break;
      case 'Extra active - Physical job':
        adjustedBMR *= 1.9;
        break;
    }

    return adjustedBMR;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Stack(fit: StackFit.expand, children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text(
                  "NOTIFICATIONS",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ])),
      body: Scrollbar(
        controller: _scrollController,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: bmiTitles.length + bmrTitles.length,
              // Include the BMI data count
              itemBuilder: (BuildContext context, int index) {
                if (index < bmiTitles.length) {
                  // Display BMI data
                  final title = bmiTitles[index];
                  final subtitle = bmiSubtitles[index];
                  final trailing = bmiTrailings[index];

                  return Container(
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white12,
                        ),
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        title: Text(
                          title,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          subtitle,
                          style: TextStyle(color: Colors.white30),
                        ),
                        trailing: Text(
                          trailing,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                } else if (index < bmiTitles.length + bmrTitles.length) {
                  // Display BMR data
                  final bmrIndex = index - bmiTitles.length;
                  final title = bmrTitles[bmrIndex];
                  final subtitle = bmrSubtitles[bmrIndex];
                  final trailing = bmrTrailings[bmrIndex];

                  return Container(
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white12,
                        ),
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        title: Text(
                          title,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          subtitle,
                          style: TextStyle(color: Colors.white30),
                        ),
                        trailing: Text(
                          trailing,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                } //else {
                  // Display existing notifications
                  //final notificationIndex =
                  //    index - bmiTitles.length - bmrTitles.length;
                  //final title = notificationTitles[notificationIndex];
                  //final subtitle = notificationSubtitles[notificationIndex];
                  //final trailing = notificationTrailings[notificationIndex];

                  //return Dismissible(
                  //  background: Container(
                  //    color: Colors.red,
                  //    child: Icon(Icons.delete),
                  //  ),
                  //  key: Key(title),
                  //  onDismissed: (DismissDirection direction) {
                  //    setState(() {
                  //      notificationTitles.removeAt(notificationIndex);
                  //      notificationSubtitles.removeAt(notificationIndex);
                  //      notificationTrailings.removeAt(notificationIndex);
                  //    });
                  //  },
                  //  child: Container(
                  //    height: 80,
                  //    decoration: BoxDecoration(
                  //      border: Border(
                  //        bottom: BorderSide(
                  //          color: Colors.white12,
                  //        ),
                  //      ),
                  //    ),
                  //    child: Center(
                  //      child: ListTile(
                  //        title: Text(
                  //          title,
                  //          style: TextStyle(color: Colors.white),
                  //        ),
                  //        subtitle: Text(
                  //          subtitle,
                  //          style: TextStyle(color: Colors.white30),
                  //        ),
                  //        trailing: Text(
                  //          trailing,
                  //          style: TextStyle(color: Colors.white),
                  //        ),
                  //      ),
                  //    ),
                  //  ),
                  //);
                //}
              },
            ),
          ),
        ),
      ),
    );
  }
}
