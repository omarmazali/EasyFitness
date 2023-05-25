import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController _scrollController = ScrollController();

  List<String> titles = [
    "Congratulations",
    "Attention",
    "Daily Activity",
  ];
  List<String> subtitles = [
    "35% your daily challenge completed",
    "Your subscription is going to expire very soon. Subscribe now.",
    "Time for your workout session "
  ];
  List<String> trailings = [
    "9:45 AM",
    "9:38 AM",
    "8:25 AM",
  ];

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
                  itemCount: titles.length,
                  itemBuilder: (BuildContext context, int index) {
                    final title = titles[index];
                    final subtitle = subtitles[index];
                    final trailing = trailings[index];
                    return Dismissible(
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete),
                      ),
                      key: ValueKey<String>(title),
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          titles.removeAt(index);
                          subtitles.removeAt(index);
                          trailings.removeAt(index);
                        });
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white12,
                              ),
                            ),),
                        child: Center(
                          child: ListTile(
                            title: Text(title, style: TextStyle(color: Colors.white),),
                            subtitle: Text(subtitle, style: TextStyle(color: Colors.white30)),
                            trailing: Text(trailing, style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    );
                  })),
        ),
      ),
    );
  }
}
