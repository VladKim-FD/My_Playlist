import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_playlist_app/constants.dart';
import 'package:my_playlist_app/item_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyPlaylist extends StatefulWidget {
  @override
  State<MyPlaylist> createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  final List<Item> items1 = [
    Item(
        name: 'Back to you',
        audioPath: 'assets/songs/fame_on_fire/Fame on Fire - Back to You.mp3',
        imagePath: 'assets/images/fame_on_fire/back-yo-you.jpg'),
    Item(
        name: 'Down',
        audioPath: 'assets/songs/fame_on_fire/Fame on Fire - Down.mp3',
        imagePath: 'assets/images/fame_on_fire/down.jpg'),
    Item(
        name: 'Shape of You',
        audioPath: 'assets/songs/fame_on_fire/Fame on Fire - Shape of You.mp3',
        imagePath: 'assets/images/fame_on_fire/shape-of-you.jpg'),
    Item(
        name: 'Wait',
        audioPath: 'assets/songs/fame_on_fire/Fame on Fire - Wait.mp3',
        imagePath: 'assets/images/fame_on_fire/wait.jpg'),
    Item(
        name: 'Lost in Doubt',
        audioPath:
        'assets/songs/fame_on_fire/Fame_on_Fire_-_Lost_In_Doubt_(musmore.com).mp3',
        imagePath: 'assets/images/fame_on_fire/lost-in-doubt.jpg'),
  ];
  final List<Item> items2 = [
    Item(
        name: 'I\'ll be good',
        audioPath: 'assets/songs/james_young/jaymes-young-ill-be-good.mp3',
        imagePath: 'assets/images/james_young/ill-be-good.jpg'),
    Item(
        name: 'Infinity',
        audioPath:
        'assets/songs/james_young/jaymes-young-infinity.mp3',
        imagePath: 'assets/images/james_young/Infinity.jpg'),
    Item(
        name: 'Moon Dust',
        audioPath: 'assets/songs/james_young/jaymes-young-moondust.mp3',
        imagePath: 'assets/images/james_young/moon-dust.jpg'),
    Item(
        name: 'Thank ypu for the happiest year in my life',
        audioPath:
        'assets/songs/james_young/jaymes-young-thank_you_for_the_happiest_year_of_my_life.mp3',
        imagePath: 'assets/images/james_young/Jaymes-Young-Happiest-Year.jpg'),
    Item(
        name: 'Feel Something',
        audioPath: 'assets/songs/james_young/jaymes_young-feel-something.mp3',
        imagePath: 'assets/images/james_young/feel-something.jpg'),
  ];
  final List<Item> items3 = [
    Item(
        name: 'Easy on Me',
        audioPath: 'assets/songs/no_resolve/No Resolve - Easy On Me.mp3',
        imagePath: 'assets/images/no-resolve/easy-on-me.jpg'),
    Item(
        name: 'Worth the fight',
        audioPath: 'assets/songs/no_resolve/no_resolve-worth_the_fight.mp3',
        imagePath: 'assets/images/no-resolve/worth-the-fight.jpg'),
    Item(
        name: 'How far I\'ll go ',
        audioPath:
        'assets/songs/no_resolve/No_Resolve_-_How_Far_Ill_Go_(musmore.com).mp3',
        imagePath: 'assets/images/no-resolve/how-far-ill-go.jpg'),
    Item(
        name: 'STAY',
        audioPath:
        'assets/songs/no_resolve/No_Resolve_-_STAY_(musmore.com).mp3',
        imagePath: 'assets/images/no-resolve/stay.jpg'),
    Item(
        name: 'Surface Pressure',
        audioPath:
        'assets/songs/no_resolve/No_Resolve_-_Surface_Pressure_(musmore.com).mp3',
        imagePath: 'assets/images/no-resolve/surface-pressure.jpg'),
  ];
  final List<Item> items4 = [
    Item(
        name: 'Losing Patience',
        audioPath:
        'assets/songs/nothing_nowhere/Illenium & nothing,nowhere. - Losing Patience.mp3',
        imagePath: 'assets/images/nothing-nowhere/losing-patience.jpg'),
    Item(
        name: 'Fake Friend',
        audioPath:
        'assets/songs/nothing_nowhere/Nothing,nowhere. - Fake Friend.mp3',
        imagePath: 'assets/images/nothing-nowhere/fake-friend.jpg'),
    Item(
        name: 'Love or Chemistry',
        audioPath:
        'assets/songs/nothing_nowhere/nothing,nowhere. - love or chemistry.mp3',
        imagePath: 'assets/images/nothing-nowhere/love-or-chemistry.jpg'),
    Item(
        name: 'Pieces of You',
        audioPath:
        'assets/songs/nothing_nowhere/nothing,nowhere. - Pieces of You.mp3',
        imagePath: 'assets/images/nothing-nowhere/pieces-of-you.jpg'),
    Item(
        name: 'Nevermore',
        audioPath:
        'assets/songs/nothing_nowhere/nothing,nowhere.-Nevermore.mp3',
        imagePath: 'assets/images/nothing-nowhere/nevermore.jpg'),
  ];
  final List<Item> items5 = [
    Item(
        name: 'Same Old War',
        audioPath:
        'assets/songs/our_last_night/Our Last Night - Same Old War (mp3store.cc).mp3',
        imagePath: 'assets/images/our-last-night/same-old-war.jpg'),
    Item(
        name: 'Sunrise',
        audioPath: 'assets/songs/our_last_night/Our Last Night - Sunrise.mp3',
        imagePath: 'assets/images/our-last-night/sunrise.jpg'),
    Item(
        name: 'You broke me first',
        audioPath:
        'assets/songs/our_last_night/Our Last Night - You Broke Me First.mp3',
        imagePath: 'assets/images/our-last-night/you-broke-me-first.jpg'),
    Item(
        name: 'Habits',
        audioPath:
        'assets/songs/our_last_night/our-last-night-habits-stay-high-cover-tove-lo.mp3',
        imagePath: 'assets/images/our-last-night/habits.jpg'),
    Item(
        name: 'Voices',
        audioPath: 'assets/songs/our_last_night/our-last-night-voices.mp3',
        imagePath: 'assets/images/our-last-night/voices.jpg'),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();
  int? playingIndex1;
  int? playingIndex2;
  int? playingIndex3;
  int? playingIndex4;
  int? playingIndex5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My playlist', style: kTitleTextStyle),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Fame on Fire',
                                  style: ktitleOfSliderStyle,
                                ),
                              ),
                              CarouselSlider.builder(
                                  itemCount: items1.length,
                                  itemBuilder: (context,index, realIndex) =>
                                      Container(
                                        margin:
                                        EdgeInsets.symmetric(horizontal: 4),
                                        height: 100,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  items1[index].imagePath)),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            items1[index].name,
                                            style:
                                            TextStyle(color: Colors.grey),
                                          ),
                                          leading: IconButton(
                                            icon: playingIndex1 == index
                                                ? FaIcon(FontAwesomeIcons.stop)
                                                : FaIcon(FontAwesomeIcons.play),
                                            onPressed: () async {
                                              if (playingIndex1 ==
                                                  index) {
                                                audioPlayer.stop();
                                                setState(() {
                                                  playingIndex1 = null;
                                                });
                                              } else {
                                                try {
                                                  await audioPlayer.setAsset(
                                                      items1[index].audioPath);
                                                  audioPlayer.play();
                                                  setState(() {
                                                    playingIndex1 = index;
                                                  });
                                                } catch (error) {
                                                  print(error);
                                                  // ScaffoldMessenger.of(context).showSnackBar(
                                                  //     SnackBar(
                                                  //         backgroundColor:
                                                  //             Colors.red.withOpacity(0.5),
                                                  //         content: Text(
                                                  //             'Oops, an error has occured!')));
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                  options: CarouselOptions(
                                    height: 300,
                                    reverse: true,
                                    enlargeCenterPage: true,
                                  ))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'James Young',
                                  style: ktitleOfSliderStyle,
                                ),
                              ),
                              CarouselSlider.builder(
                                  itemCount: items2.length,
                                  itemBuilder: (context, index, realIndex) =>
                                      Container(
                                        margin:
                                        EdgeInsets.symmetric(horizontal: 4),
                                        height: 100,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  items2[index].imagePath)),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            items2[index].name,
                                            style:
                                            TextStyle(color: Colors.grey),
                                          ),
                                          leading: IconButton(
                                            icon: playingIndex2 == index
                                                ? FaIcon(FontAwesomeIcons.stop)
                                                : FaIcon(FontAwesomeIcons.play),
                                            onPressed: () async {
                                              if (playingIndex2 ==
                                                  index) {
                                                audioPlayer.stop();
                                                setState(() {
                                                  playingIndex2 = null;
                                                });
                                              } else {
                                                try {
                                                  await audioPlayer.setAsset(
                                                      items2[index].audioPath);
                                                  audioPlayer.play();
                                                  setState(() {
                                                    playingIndex2 = index;
                                                  });
                                                } catch (error) {
                                                  print(error);
                                                  // ScaffoldMessenger.of(context).showSnackBar(
                                                  //     SnackBar(
                                                  //         backgroundColor:
                                                  //             Colors.red.withOpacity(0.5),
                                                  //         content: Text(
                                                  //             'Oops, an error has occured!')));
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                  options: CarouselOptions(
                                    height: 300,
                                    reverse: true,
                                    enlargeCenterPage: true,
                                  ))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'No Resolve',
                                  style: ktitleOfSliderStyle,
                                ),
                              ),
                              CarouselSlider.builder(
                                  itemCount: items2.length,
                                  itemBuilder: (context, index, realIndex) =>
                                      Container(
                                        margin:
                                        EdgeInsets.symmetric(horizontal: 4),
                                        height: 100,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  items3[index].imagePath)),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            items3[index].name,
                                            style:
                                            TextStyle(color: Colors.grey),
                                          ),
                                          leading: IconButton(
                                            icon: playingIndex3 == index
                                                ? FaIcon(FontAwesomeIcons.stop)
                                                : FaIcon(FontAwesomeIcons.play),
                                            onPressed: () async {
                                              if (playingIndex3 == index) {
                                                audioPlayer.stop();
                                                setState(() {
                                                  playingIndex3 = null;
                                                });
                                              } else {
                                                try {
                                                  await audioPlayer.setAsset(
                                                      items3[index].audioPath);
                                                  audioPlayer.play();
                                                  setState(() {
                                                    playingIndex3 = index;
                                                  });
                                                } catch (error) {
                                                  print(error);
                                                  // ScaffoldMessenger.of(context).showSnackBar(
                                                  //     SnackBar(
                                                  //         backgroundColor:
                                                  //             Colors.red.withOpacity(0.5),
                                                  //         content: Text(
                                                  //             'Oops, an error has occured!')));
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                  options: CarouselOptions(
                                    height: 300,
                                    reverse: true,
                                    enlargeCenterPage: true,
                                  ))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Nothing, Nowhere',
                                  style: ktitleOfSliderStyle,
                                ),
                              ),
                              CarouselSlider.builder(
                                  itemCount: items4.length,
                                  itemBuilder: (context, index, realIndex) =>
                                      Container(
                                        margin:
                                        EdgeInsets.symmetric(horizontal: 4),
                                        height: 100,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  items4[index].imagePath)),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            items4[index].name,
                                            style:
                                            TextStyle(color: Colors.grey),
                                          ),
                                          leading: IconButton(
                                            icon: playingIndex4 == index
                                                ? FaIcon(FontAwesomeIcons.stop)
                                                : FaIcon(FontAwesomeIcons.play),
                                            onPressed: () async {
                                              if (playingIndex4 ==
                                                  index) {
                                                audioPlayer.stop();
                                                setState(() {
                                                  playingIndex4 = null;
                                                });
                                              } else {
                                                try {
                                                  await audioPlayer.setAsset(
                                                      items4[index].audioPath);
                                                  audioPlayer.play();
                                                  setState(() {
                                                    playingIndex4 = index;
                                                  });
                                                } catch (error) {
                                                  print(error);
                                                  // ScaffoldMessenger.of(context).showSnackBar(
                                                  //     SnackBar(
                                                  //         backgroundColor:
                                                  //             Colors.red.withOpacity(0.5),
                                                  //         content: Text(
                                                  //             'Oops, an error has occured!')));
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                  options: CarouselOptions(
                                    height: 300,
                                    reverse: true,
                                    enlargeCenterPage: true,
                                  ))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Our Last Night',
                                  style: ktitleOfSliderStyle,
                                ),
                              ),
                              CarouselSlider.builder(
                                  itemCount: items5.length,
                                  itemBuilder: (context, index, realIndex) =>
                                      Container(
                                        margin:
                                        EdgeInsets.symmetric(horizontal: 4),
                                        height: 100,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  items5[index].imagePath)),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            items5[index].name,
                                            style:
                                            TextStyle(color: Colors.grey),
                                          ),
                                          leading: IconButton(
                                            icon: playingIndex5 == index
                                                ? FaIcon(FontAwesomeIcons.stop)
                                                : FaIcon(FontAwesomeIcons.play),
                                            onPressed: () async {
                                              if (playingIndex5 ==
                                                  index) {
                                                audioPlayer.stop();
                                                setState(() {
                                                  playingIndex5 = null;
                                                });
                                              } else {
                                                try {
                                                  await audioPlayer.setAsset(
                                                      items5[index].audioPath);
                                                  audioPlayer.play();
                                                  setState(() {
                                                    playingIndex5 = index;
                                                  });
                                                } catch (error) {
                                                  print(error);
                                                  // ScaffoldMessenger.of(context).showSnackBar(
                                                  //     SnackBar(
                                                  //         backgroundColor:
                                                  //             Colors.red.withOpacity(0.5),
                                                  //         content: Text(
                                                  //             'Oops, an error has occured!')));
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                  options: CarouselOptions(
                                    height: 300,
                                    reverse: true,
                                    enlargeCenterPage: true,
                                  ))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
