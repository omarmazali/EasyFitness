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
    return Container(
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
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Spacer(),
          if (actionTitle != null)
            TextButton(
              onPressed: action,
              child: Text(
                "${actionTitle}",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14.0,
                  color: Colors.lightGreenAccent,
                ),
              ),
            )
        ],
      ),
    );
  }
}
