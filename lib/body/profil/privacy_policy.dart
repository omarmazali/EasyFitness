import 'package:easyfitness/body/acceuil.dart';
import 'package:flutter/material.dart';

import 'profil.dart';


class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Acceuil(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.grey[800],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        "PRIVACY POLICY",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Lorem ipsum dolor sit amet",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Consectetur adipiscing elit. Natoqu phasellus lobortis "
                      "mattis cursus faucibus hac proin risus. Turpis "
                      "phasellus massa ullamcorper volutpat. Ornare "
                      "commodo non integer fermentum nisi, morbi id. Vel "
                      "tortor mauris feugiat amet, maecenas facilisis "
                      "risus, in faucibus. Vestibulum ullamcorper fames "
                      "eget enim diam fames faucibus duis ac. Aliquam non "
                      "tellus semper in dignissim nascetur venenatis "
                      "lacus.",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Lectus vel non varius interdum vel tellus sed mattis. "
                      "Sit laoreet auctor arcu mauris tincidunt sociis "
                      "tristique pharetra neque. Aliquam pharetra "
                      "elementum nisl sapien. Erat nisl morbi eu dolor in. "
                      "Sapien ut lacus dui libero morbi tristique.",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sit praesent mi, dolor, magna in pellentesque "
                      "sollicitudin odio sed. Sit nibh aliquam enim ipsum "
                      "lectus sem fermentum congue velit. Purus habitant "
                      "odio in morbi aliquet velit pulvinar. Facilisis ut "
                      "amet interdum pretium. Fames pretium eget orci "
                      "facilisis mattis est libero facilisis ullamcorper. "
                      "Est auctor amet egestas risus libero et. Auctor "
                      "faucibus sit id fringilla vitae. Ac volutpat "
                      "sodales tristique ut netus turpis.",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Donec ac sem vel tellus iaculis vestibulum. Donec dapibus dolor viverra metus facilisis volutpat. Pellentesque vestibulum massa tincidunt, ornare orci sed, mattis eros. Vivamus ante massa, tristique vitae urna sit amet, pulvinar accumsan urna. Proin bibendum nibh et condimentum placerat. Aliquam erat volutpat. Integer a justo quis augue tempor posuere. Nullam non purus maximus odio molestie ultrices. Morbi nisi felis, pellentesque eget semper a, commodo nec lacus. Donec vitae nisi purus. Sed interdum justo magna, ac dictum neque dignissim vel. Phasellus fermentum pulvinar semper. Nulla a mattis metus, et aliquam libero.",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
