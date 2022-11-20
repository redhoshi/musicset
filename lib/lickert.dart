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
  SfRangeValues _initialValues = SfRangeValues(4.0, 8.0); //デフォルトのレンジ幅
  SfRangeValues _values = SfRangeValues(4.0, 8.0); //ranges sliderのフォルト値
  int selectedRadio = 1;
  AudioPlayer player = new AudioPlayer(mode: PlayerMode.LOW_LATENCY);

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
                SizedBox(
                  height: screenSize.height * 1 / 4,
                  child: FloatingActionButton(
                    mini: false,
                    onPressed: null,
                    elevation: 0, // 通常時のエレベーション
                    hoverElevation: 0, // マウスホバー時のエレベーション
                    highlightElevation: 0, // ボタン押下時のエレベーション
                    child: Icon(Icons.face),
                  ),
                ),
                SizedBox(
                  child: SfRangeSelector(
                    min: 0.0,
                    max: 5.0,
                    initialValues: _initialValues,
                    interval: 1,
                    showTicks: true,
                    showLabels: true,
                    child: Container(
                      color: Colors.green[100],
                    ),
                  ),
                ),
                SizedBox(
                  child: SfRangeSlider(
                      min: 0.0,
                      max: 10.0,
                      values: _values,
                      onChanged: (SfRangeValues newValues) {
                        setState(() {
                          _values = newValues;
                        });
                      }),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < 5; i++)
                        SizedBox(
                          width: screenSize.width * 1 / 8,
                          height: screenSize.height * 1 / 8,
                          child: Radio(
                            value: i,
                            groupValue: selectedRadio,
                            activeColor: Colors.green,
                            onChanged: (val) {
                              print("Radio $val");
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
                        height: screenSize.height * 1 / 8,
                        child: Text('当てはまる $i'),
                      ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < 5; i++)
                        SizedBox(
                          width: screenSize.width * 1 / 8,
                          child: Radio(
                            value: i,
                            groupValue: selectedRadio,
                            activeColor: Colors.green,
                            onChanged: (val) {
                              print("Radio $val");
                              setSelectedRadio(i);
                            },
                          ),
                        ),
                      for (int i = 0; i < 5; i++) SizedBox(),
                    ]),
              ])),

              /*
              Center(
                  heightFactor: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.40,
                      left: screenSize.width / 5,
                      right: screenSize.width / 5,
                    ),
                    child: new SizedBox(
                      height: 80,
                      child: Card(
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Text('Card04'),
                                    new SizedBox(
                                      width: screenSize.width * 0.15,
                                    ),
                                    Text('please tap'),
                                    new SizedBox(
                                      width: screenSize.width * 0.15,
                                    ),
                                    Text('Card04'),
                                  ],
                                ),
                              ]),
                        ),
                        color: Colors.white, // Cardの背景色
                        elevation: 8, // 影の離れ具合を調整するオプション
                        shadowColor: Colors.black, // 影の色を設定するオプション
                      ),
                    ),
                  )),*/
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
