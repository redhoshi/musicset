import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:setmusic/art_about.dart';
import 'package:setmusic/contact.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:url_launcher/url_launcher.dart';
import 'config/config.dart';

class ArtPage extends StatefulWidget {
  const ArtPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ArtPage> createState() => _ArtPageState();
}

enum SingingCharacter { lafayette, jefferson } //radioボタンの初期値class

class _ArtPageState extends State<ArtPage> {
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ArtAboutPage(title: '')));
                                },
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ContactPage(title: '')));
                                },
                                onHover: (value) {
                                  setState(() {
                                    _isHovering[2] = value;
                                  });
                                },
                                child: Text(
                                  'Contact me',
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

                /*SingleChildScrollView(
                child: */
                Center(
                    child: Column(children: [
                  Padding(
                    //padding: EdgeInsets.only(top: screenSize.height * 1 / 8),
                    padding: EdgeInsets.all(screenSize.height * 1 / 9),
                    child: SizedBox(
                      child: Column(children: [
                        for (int j = 0; j < 8; j++)
                          Column(children: [
                            new SizedBox(
                              height: 40,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int j = 0; j < 4; j++)
                                    Row(children: [
                                      new SizedBox(width: 40),
                                      new SizedBox(
                                          height: 150,
                                          width: 220,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 5),
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.black26,
                                                    offset:
                                                        new Offset(10.0, 10.0),
                                                  )
                                                ]),
                                            child: Row(children: [
                                              new MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                    onTap: () async {
                                                      //dialogboxを表示
                                                      await launch("https://");
                                                    },
                                                    child: Image.network(
                                                      "assets/images/9F2621A6-4CE6-4067-A448-6BED3FAE31F7.jpg",
                                                      // width: 500,
                                                      fit: BoxFit.fitWidth,
                                                    )),
                                              ),
                                              /*
                                              new SizedBox(
                                                child: Image.asset(
                                                    "assets/images/9F2621A6-4CE6-4067-A448-6BED3FAE31F7.jpg"),
                                              ),*/
                                            ]),
                                          )),
                                    ]),
                                ]),
                          ]),
                        /*
                      new SizedBox(
                        width: screenSize.width * 1 / 24,
                      ),
                      new SizedBox(
                          height: 150,
                          width: 220,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black12, width: 5),
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.black26,
                                    offset: new Offset(10.0, 10.0),
                                  )
                                ]),
                            child: Row(children: [
                              Image.asset(
                                  "assets/images/9F2621A6-4CE6-4067-A448-6BED3FAE31F7.jpg"),
                            ]),
                          )),*/
                      ]),
                    ),
                  ),
                ])),
                //),
              ],
            )),
          ])),
      body: Container(),
    );
  }
}
