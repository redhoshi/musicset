import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'config/config.dart';

class LickertPage extends StatefulWidget {
  const LickertPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LickertPage> createState() => _LickertPageState();
}

enum SingingCharacter { lafayette, jefferson } //radioボタンの初期値class

class _LickertPageState extends State<LickertPage> {
  int _counter = 0;
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  final _isHovering = [false, false, false, false];

  int selectedRadio = 1;
  int selectedRadio1 = 2;
  int selectedRadio2 = 2;
  int selectedRadio3 = 2;
  int selectedRadio4 = 2;
  int selectedRadio5 = 2;

//  final _selectedRadio = [1, 2, 3, 4, 5];
  AudioPlayer player = new AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  Future<void> reload() async {
    selectedRadio = 1;
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
          child: Stack(
            children: [
              Container(
                color: Colors.teal,
                height: screenSize.height * 0.07,
                width: screenSize.width,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text('EXPLORE'),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                '$_isHovering',
                                style: TextStyle(
                                  color: _isHovering[0]
                                      ? Colors.blue.shade200
                                      : Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: screenSize.width / 20),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Contact Us',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width / 50,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                  child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 1 / 12),
                  child: SizedBox(
                    height: screenSize.height * 1 / 9,
                    child: FloatingActionButton(
                      //音を再生するボタンに変更する
                      mini: false,
                      onPressed: null,
                      elevation: 0,
                      hoverElevation: 0,
                      highlightElevation: 0,
                      child: Icon(Icons.face),
                    ),
                  ),
                ),
                //for (int j = 0; j < 5; j++)
                Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < 5; i++)
                          SizedBox(
                            width: screenSize.width * 1 / 8,
                            height: screenSize.height * 1 / 18,
                            child: Radio(
                              value: i,
                              groupValue: selectedRadio,
                              activeColor: Colors.green,
                              onChanged: (val) {
                                setSelectedRadio(i);
                              },
                            ),
                          ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < 5; i++)
                        SizedBox(
                          width: screenSize.width * 1 / 8,
                          height: screenSize.height * 1 / 18,
                          child: Text('当てはまる $i'),
                        ),
                    ],
                  ),
                ]),
                Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int j = 0; j < 5; j++)
                          SizedBox(
                            width: screenSize.width * 1 / 8,
                            height: screenSize.height * 1 / 18,
                            child: Radio(
                              value: j,
                              groupValue: selectedRadio1,
                              activeColor: Colors.green,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadio1 = j;
                                });
                              },
                            ),
                          ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < 5; i++)
                        SizedBox(
                          width: screenSize.width * 1 / 8,
                          height: screenSize.height * 1 / 18,
                          child: Text('当てはまる $i'),
                        ),
                    ],
                  ),
                ]),
                Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int j = 0; j < 5; j++)
                          SizedBox(
                            width: screenSize.width * 1 / 8,
                            height: screenSize.height * 1 / 18,
                            child: Radio(
                              value: j,
                              groupValue: selectedRadio2,
                              activeColor: Colors.green,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadio2 = j;
                                });
                              },
                            ),
                          ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < 5; i++)
                        SizedBox(
                          width: screenSize.width * 1 / 8,
                          height: screenSize.height * 1 / 18,
                          child: Text('当てはまる $i'),
                        ),
                    ],
                  ),
                ]),
                Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int j = 0; j < 5; j++)
                          SizedBox(
                            width: screenSize.width * 1 / 8,
                            height: screenSize.height * 1 / 18,
                            child: Radio(
                              value: j,
                              groupValue: selectedRadio4,
                              activeColor: Colors.green,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadio4 = j;
                                });
                              },
                            ),
                          ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < 5; i++)
                        SizedBox(
                          width: screenSize.width * 1 / 8,
                          height: screenSize.height * 1 / 18,
                          child: Text('当てはまる $i'),
                        ),
                    ],
                  ),
                ]),
                Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int j = 0; j < 5; j++)
                          SizedBox(
                            width: screenSize.width * 1 / 8,
                            height: screenSize.height * 1 / 18,
                            child: Radio(
                              value: j,
                              groupValue: selectedRadio5,
                              activeColor: Colors.green,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadio5 = j;
                                });
                              },
                            ),
                          ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < 5; i++)
                        SizedBox(
                          width: screenSize.width * 1 / 8,
                          height: screenSize.height * 1 / 18,
                          child: Text('当てはまる $i'),
                        ),
                    ],
                  ),
                ]),

                SizedBox(
                  height: screenSize.height * 1 / 14,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      // Navigator.push(context,)最初から実行
                      print('relo');
                      reload();
                    },
                    icon: new Icon(Icons.add),
                    label: Text("次へ"),
                  ),
                ),
              ])),
            ],
          )),
      body: Container(),

      /*
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        player.play(
            "https://firebasestorage.googleapis.com/v0/b/mixmusic-1d092.appspot.com/o/dri_mar.mp3?alt=media&token=d3615727-20fb-45aa-8df2-ce6d1ca349ea");
      }),*/
    );
  }
}
