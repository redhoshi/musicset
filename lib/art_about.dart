import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'config/config.dart';

class ArtAboutPage extends StatefulWidget {
  const ArtAboutPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ArtAboutPage> createState() => _ArtAboutPageState();
}

enum SingingCharacter { lafayette, jefferson } //radioボタンの初期値class

class _ArtAboutPageState extends State<ArtAboutPage> {
  int _counter = 0;
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  final _isHovering = [false, false, false, false];

  int selectedRadio = 2;
  int selectedRadio1 = 2;
  int selectedRadio2 = 2;
  int selectedRadio3 = 2;
  int selectedRadio4 = 2;
  int selectedRadio5 = 2;

  AudioPlayer player = new AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  Future<void> reload() async {
    selectedRadio = 2;
    selectedRadio1 = 2;
    selectedRadio2 = 2;
    selectedRadio3 = 2;
    selectedRadio4 = 2;
    selectedRadio5 = 2;
    setState(() {});
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    SingingCharacter? _character = SingingCharacter.jefferson; //radioデフォルト値
    var _selectedIndex = -1;

    setSelectedRadio(int val) {
      setState(() {
        selectedRadio = val;
      });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: Stack(children: [
            SingleChildScrollView(
                child: Stack(
              children: [
                Column(children: [
                  Container(
                    color: Colors.white,
                    height: screenSize.height * 0.07,
                    width: screenSize.width,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenSize.width / 10,
                          ),
                          Text("Redhoshi's PhotoFolio"),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  onHover: (value) {
                                    setState(() {
                                      _isHovering[0] = value;
                                    });
                                    print(_isHovering);
                                  },
                                  child: Text(
                                    'About',
                                    style: TextStyle(
                                      color: _isHovering[0]
                                          ? Colors.indigo
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenSize.width / 20),
                                InkWell(
                                  onTap: () {},
                                  onHover: (value) {
                                    setState(() {
                                      _isHovering[2] = value;
                                    });
                                  },
                                  child: Text(
                                    'Contact us',
                                    style: TextStyle(
                                        color: _isHovering[2]
                                            ? Colors.indigo
                                            : Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenSize.width / 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 16,
                  ),
                  SizedBox(
                    width: 1000,
                    height: 800,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Row(children: [
                        Text(
                          'About',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'About',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ])
              ],
            )),
          ])),
      body: Container(),
    );
  }
}
