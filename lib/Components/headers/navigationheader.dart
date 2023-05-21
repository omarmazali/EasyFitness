import 'package:flutter/material.dart';

class NavigationHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool? backbutton;

  const NavigationHeader({
    Key? key,
    required this.title,
    this.subtitle,
    this.backbutton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      width:  MediaQuery.of(context).size.width ,

      margin: const EdgeInsets.all(6.0),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),


          ),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (backbutton == true) // add back button if necessary
            GestureDetector(
              onTap: () {
                 Navigator.pop(context);
                print("hello backbutton yak khdam ?");
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 26.0,
                color: Colors.white,
              ),
            ),
          SizedBox(height: 16.0),

          Text(
            "${title}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.0),

          if (subtitle != null)
            Text(
              "${subtitle}",
              style: TextStyle(
                fontFamily: 'System',
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Colors.grey[500],
              ),
            ),
        ],
      ),
    );
  }
}

class NavigationHeaderPreviews extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  NavigationHeader(title: "Create your perfect workout ",subtitle: "Let's add an exercice",backbutton: true,);


  }
}
