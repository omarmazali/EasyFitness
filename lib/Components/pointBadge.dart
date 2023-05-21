import 'package:flutter/material.dart';
class PointBadge extends StatefulWidget {
  final int? point;

  const PointBadge({Key? key ,this.point}) : super(key: key);

  @override
  State<PointBadge> createState() => _PointBadgeState();
}

class _PointBadgeState extends State<PointBadge> {
  Color goldColor = Color(0xFFD4AF37);

  @override
  Widget build(BuildContext context) {
    return  Container(

      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        width: 70,
        height: 22,
        decoration: BoxDecoration(
        color: goldColor ,
          borderRadius: BorderRadius.circular(6),
        ),

        child: Text(


          " +${widget.point} point${widget.point?.compareTo(1) == 1 ? 's' : ''}",
          style: TextStyle(
            color: Colors.white,
          ),


        ),
      ),

    );
  }
}
class PointBadgeview extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  PointBadge(point: 24,);


  }
}
