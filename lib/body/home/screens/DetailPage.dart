import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

import '../models/popularExercice.dart';

class ExerciseDetailPage extends StatefulWidget {
  final List<PopularExercise> exercises;
  final int currentIndex;

  ExerciseDetailPage({
    required this.exercises,
    required this.currentIndex,
  });

  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  void initializeVideoPlayer() {
    final exercise = widget.exercises[widget.currentIndex];
    videoPlayerController = VideoPlayerController.asset('assets/videos/boy.mp4')
      ..initialize().then((_) {
        setState(() {});
        videoPlayerController!.play(); // Start the video automatically
        videoPlayerController!.setLooping(true); // Set looping to true
      });
  }

  void toggleFullScreen() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final exercise = widget.exercises[widget.currentIndex];

    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          toggleFullScreen();
        } else {
          SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        }

        final videoPlayer = videoPlayerController != null &&
                videoPlayerController!.value.isInitialized
            ? Container(
                width: double.infinity,
                height: double.infinity,
                child: AspectRatio(
                  aspectRatio: videoPlayerController!.value.aspectRatio,
                  child: VideoPlayer(videoPlayerController!),
                ),
              )
            : Container();

        return Scaffold(
          //appBar: AppBar(title: Text(exercise.name)),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      videoPlayer,
                      Positioned.fill(
                        child: Container(
                          color: Colors.black.withOpacity(0.3),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 550.0),
                                child: Text(
                                  exercise.details,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 70,right: 10.0),
                                        child: Icon(
                                          Icons.format_list_numbered,
                                          size: 30.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '2',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 50,right: 10.0),
                                        child: Icon(
                                          Icons.repeat,
                                          size: 30.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '2',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 50,right: 10.0),
                                        child: Icon(
                                          Icons.fitness_center,
                                          size: 30.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '2',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 46,
                                width: 120,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    backgroundColor: Colors.lightGreenAccent,
                                  ),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Next',
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
                                  ]),
                                  onPressed: () {
                                    videoPlayerController?.pause();

                                    if (widget.currentIndex <
                                        widget.exercises.length - 1) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ExerciseDetailPage(
                                            exercises: widget.exercises,
                                            currentIndex:
                                                widget.currentIndex + 1,
                                          ),
                                        ),
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Congratulations!'),
                                            content: Text(
                                                'You have completed your workout.'),
                                            actions: [
                                              TextButton(
                                                child: Text('OK', style: TextStyle(color: Colors.lightGreenAccent),),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushReplacementNamed(
                                                          'Acceuil');
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
