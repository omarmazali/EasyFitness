import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionTitle;
  final VoidCallback? action;


  const SectionHeader({
    Key? key,
    required this.title,
    this.actionTitle,
    this.action,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 50,

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "${title}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,



                ),
                
              ),
            
            ),
            Spacer(),
            if (actionTitle != null)
              TextButton(
                  onPressed: action,
                  child: Text("${actionTitle}", style: TextStyle (  fontFamily: 'System',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Color(0xffD0FD3E),
                  ),
                  ),


              )

          ],

        ),



    );
  }
}

// class SectionHeaderPreviews extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//
//           child: SectionHeader(title: "Preview header ",actionTitle: "see all",),
//
//
//
//
//     );
//
//
//   }
// }
