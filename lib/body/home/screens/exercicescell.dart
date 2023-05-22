import 'package:flutter/material.dart';

class ExercicesCell extends StatelessWidget {
  final String name;
  final int repetitions;
  final int sets;
  final double charge;
  final Duration duration;
  final bool isCompleted;

  final ValueChanged<bool?>? onCheckboxChanged;

  ExercicesCell({
    Key? key,
    required this.repetitions,
    required this.charge,
    required this.name,
    required this.sets,
    required this.duration,
    required this.isCompleted ,
    this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            // we can change the icone to an image
            child: Icon(Icons.fitness_center, color: Colors.white),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.repeat, size: 16),
                    SizedBox(width: 4),
                    Text("${repetitions} Reps"),
                    SizedBox(width: 12),
                    Icon(Icons.format_list_numbered, size: 16),
                    SizedBox(width: 4),
                    Text("${sets} Sets"),
                    SizedBox(width: 12),
                    Icon(Icons.fitness_center, size: 16),
                    SizedBox(width: 4),
                    Text("${charge} KG"),
                  ],
                ),
              ],
            ),
          ),
          Checkbox(
            value: isCompleted,
            onChanged: (value)=>onCheckboxChanged!(value),
          ),
        ],
      ),
    );
  }
}
