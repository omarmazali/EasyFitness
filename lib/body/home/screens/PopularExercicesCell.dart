import 'package:flutter/material.dart';

class PopularExercicesCell extends StatelessWidget {
  final String name;
  final String imgurl;
  final int repetitions;
  final int sets;
  final double charge;



  PopularExercicesCell({
    Key? key,
    required this.repetitions,
    required this.charge,
    required this.name,
    required this.sets,
     required this.imgurl

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xff2C2C2E),
        borderRadius: BorderRadius.circular(15.0),

      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
            ),
            // we can change the icone to an image
            child: Image.asset(imgurl,fit: BoxFit.cover,),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.repeat, size: 16,color: Colors.white,),
                    SizedBox(width: 4),
                    Text("${repetitions} Reps",style: TextStyle(color: Colors.white),),
                    SizedBox(width: 12),
                    Icon(Icons.format_list_numbered, size: 16,color: Colors.white,),
                    SizedBox(width: 4),
                    Text("${sets} Sets",style: TextStyle(color: Colors.white)),
                    SizedBox(width: 12),
                    Icon(Icons.fitness_center, size: 16,color: Colors.white,),
                    SizedBox(width: 4),
                    Text("${charge} KG",style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
