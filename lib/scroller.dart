import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Scroller extends StatefulWidget {
  final List<String> items;
  final String Gtext;
  final String Ptext;
  final String Ppath;
  final String Npath;
  final double Height;

  const Scroller(
      {Key? key, required this.items, required this.Gtext, required this.Ptext, required this.Ppath, required this.Npath, required this.Height})
      : super(key: key);

  @override
  State<Scroller> createState() => _ScrollerState();
}

class _ScrollerState extends State<Scroller> {
  int selectedAge = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.grey[900],
            child: Column(children: [
              SizedBox(
                height: widget.Height,
              ),
              Text(
                widget.Gtext,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
                child: Text(
                  widget.Ptext,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 300,
                child: CupertinoPicker(
                    onSelectedItemChanged: (selectedAge) {
                      setState(() {
                        this.selectedAge = selectedAge;
                      });
                    },
                    itemExtent: 60,
                    looping: false,
                    selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                      background: Colors.lightGreenAccent.withOpacity(0.5),
                    ),
                    scrollController:
                        FixedExtentScrollController(initialItem: 15),
                    children: List.generate(widget.items.length, (index) {
                      final item = widget.items[index];
                      return Center(
                        child: Text(
                          item,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      );
                    })),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(widget.Ppath);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 25,
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey[800],
                    ),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  SizedBox(
                    height: 46,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Colors.lightGreenAccent,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(widget.Npath);
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Next",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              size: 30.0,
                              color: Colors.black,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ])));
  }
}
