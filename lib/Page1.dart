
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_13_01_2024/Page2.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:test_13_01_2024/widget.dart';
import 'package:video_player/video_player.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/banner.png'},
    {"id": 2, "image_path": 'assets/images/bestsellersbanner.png'},
    {"id": 3, "image_path": 'assets/images/banner.png'}
  ];
  List<String> images = [
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
  ];
  final FlickManager flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    ),
  );

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _screen =  MediaQuery.of(context).size;
    return Scaffold(
      appBar: ReusableWidgets.getAppBar('Common appbar'),
      body:
          SingleChildScrollView(

          child:  Column(children:<Widget> [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print(currentIndex);
                    },
                    child: CarouselSlider(
                      items: imageList
                          .map(
                            (item) => Image.asset(
                          item['image_path'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 17 : 7,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key
                                    ? Colors.red
                                    : Colors.teal),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),

              Container(
                // adding margin

                margin: const EdgeInsets.all(15.0),
                // adding padding

                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(

                  // adding borders around the widget
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                ),
                // SingleChildScrollView should be
                // wrapped in an Expanded Widget
                child: Expanded(

                  //contains a single child which is scrollable
                  child: SingleChildScrollView(

                    //for horizontal scrolling
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "English Hindi Marathi Bengali Punjabi ."
                      ,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        letterSpacing: 3,
                        wordSpacing: 3,
                      ),
                    ),
                  ),
                ),
              ),

            Container(
              margin: EdgeInsets.all(15),
              child:  Center(
                child: TimerCountdown(
                  // Endtime where you want to
                  // finish the countdown currently
                  // it is 5 minutes after app starts
                  endTime: DateTime.now().add(
                    const Duration(
                      minutes: 10,
                      seconds: 00,
                    ),
                  ),

                  onEnd: () {
                    // Function Called when timer is finished
                    print("Timer finished");
                  },
                ),
              ),),

           Container(
             margin: EdgeInsets.all(15),
               child:Row(

               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children:<Widget>[

                 Container(
                   width: _screen.width * 0.45,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey.withOpacity(0.5),
                         spreadRadius: 5,
                         blurRadius: 7,
                         offset: Offset(0, 3),
                       ),
                     ],
                   ),
                   child: Column(
                     children: [
                       Container(
                         width: _screen.width * 0.45,
                         child: Icon(Icons.gamepad, size: 24, color:Colors.blueAccent),
                         padding: const EdgeInsets.all(12),
                       ),
                       Container(
                         width: _screen.width * 0.45,
                         decoration: const BoxDecoration(
                             color: Colors.blueAccent,
                             borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                         ),
                         child: Text("Game1",
                           textAlign: TextAlign.center,),
                         padding: const EdgeInsets.all(12),
                       )
                     ],
                   ),
                 ),
                 Container(
                   width: _screen.width * 0.45,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey.withOpacity(0.5),
                         spreadRadius: 5,
                         blurRadius: 7,
                         offset: Offset(0, 3),
                       ),
                     ],
                   ),
                   child: Column(
                     children: [
                       Container(
                         width: _screen.width * 0.45,
                         child: Icon(Icons.gamepad, size: 24, color:Colors.blueAccent),
                         padding: const EdgeInsets.all(12),
                       ),
                       Container(
                         width: _screen.width * 0.45,
                         decoration: const BoxDecoration(
                             color: Colors.blueAccent,
                             borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                         ),
                         child: Text("Game2",
                           textAlign: TextAlign.center,),
                         padding: const EdgeInsets.all(12),
                       )
                     ],
                   ),
                 )
               ]
           ))
            ,
          Container(
            margin: EdgeInsets.all(15),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[

                Container(
                  width: _screen.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: _screen.width * 0.45,
                        child: Icon(Icons.gamepad, size: 24, color:Colors.blueAccent),
                        padding: const EdgeInsets.all(12),
                      ),
                      Container(
                        width: _screen.width * 0.45,
                        decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                        ),
                        child: Text("Game3",
                          textAlign: TextAlign.center,),
                        padding: const EdgeInsets.all(12),
                      )
                    ],
                  ),
                ),
                Container(
                  width: _screen.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: _screen.width * 0.45,
                        child: Icon(Icons.gamepad, size: 24, color:Colors.blueAccent),
                        padding: const EdgeInsets.all(12),
                      ),
                      Container(
                        width: _screen.width * 0.45,
                        decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                        ),
                        child: Text("Game4",
                          textAlign: TextAlign.center,),
                        padding: const EdgeInsets.all(12),
                      )
                    ],
                  ),
                )
              ]
          ),),


          Container(
            margin: EdgeInsets.all(15),
             child: Text("View All",
                textAlign: TextAlign.right,
             )
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: FlickVideoPlayer(flickManager: flickManager),
            ),
          ),),



          Container(
            margin: EdgeInsets.all(15),
              child:Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[

                    Container(
                      width: _screen.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: _screen.width * 0.45/2,
                            child: Icon(Icons.person, size: 24, color:Colors.blueAccent),
                            padding: const EdgeInsets.all(12),
                          ),
                          Container(
                            width: _screen.width * 0.45/2,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                            ),
                            child: Text("User1",
                              textAlign: TextAlign.center,),
                            padding: const EdgeInsets.all(12),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: _screen.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: _screen.width * 0.45/2,
                            child: Icon(Icons.person, size: 24, color:Colors.blueAccent),
                            padding: const EdgeInsets.all(12),
                          ),
                          Container(
                            width: _screen.width * 0.45/2,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                            ),
                            child: Text("User2",
                              textAlign: TextAlign.center,),
                            padding: const EdgeInsets.all(12),
                          )
                        ],
                      ),
                    )
                  ]
              )
          ),
            Container(
                margin: EdgeInsets.all(15),
                child:Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[

                      Container(
                        width: _screen.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: _screen.width * 0.45/2,
                              child: Icon(Icons.person, size: 24, color:Colors.blueAccent),
                              padding: const EdgeInsets.all(12),
                            ),
                            Container(
                              width: _screen.width * 0.45/2,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                              ),
                              child: Text("User3",
                                textAlign: TextAlign.center,),
                              padding: const EdgeInsets.all(12),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: _screen.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: _screen.width * 0.45/2,
                              child: Icon(Icons.person, size: 24, color:Colors.blueAccent),
                              padding: const EdgeInsets.all(12),
                            ),
                            Container(
                              width: _screen.width * 0.45/2,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                              ),
                              child: Text("User4",
                                textAlign: TextAlign.right,),
                              padding: const EdgeInsets.all(12),
                            )
                          ],
                        ),
                      )
                    ]
                )
            )


            ]),
          ),

    );
  }


}
