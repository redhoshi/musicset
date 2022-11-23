import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:setmusic/contact.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:url_launcher/url_launcher.dart';
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
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                            onHover: (value) {
                              setState(() {
                                _isHovering[0] = value;
                              });
                              print(_isHovering);
                            },
                            child: Text(
                              "Redhoshi's PhotoFolio",
                              style: TextStyle(
                                color: _isHovering[0]
                                    ? Colors.indigo
                                    : Colors.black,
                              ),
                            ),
                          ),
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
                  SizedBox(
                    height: screenSize.height / 16,
                  ),
                  SizedBox(
                    width: 900,
                    height: 700,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new SizedBox(
                                width: screenSize.width / 10,
                                height: screenSize.height / 60,
                              ),
                              Text(
                                "Redhoshi's PhotoFolioとは",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              new SizedBox(
                                height: 20,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                const TextSpan(
                                    text:
                                        'Redhoshiが暇つぶしで作ったwebサイトです. Redhoshiに関する情報は',
                                    style: TextStyle(color: Colors.white)),
                                TextSpan(
                                    text: 'こちら',
                                    style:
                                        const TextStyle(color: Colors.indigo),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        // タップ時
                                        await launch(
                                            'https://redhoshi.github.io/');
                                      }),
                                const TextSpan(
                                    text:
                                        'から.\n暇なときに撮った写真をぽつらぽつら掲載していく予定です.\n使用しているカメラは以下の通りです.\n\n-富士フィルムFUJIFILM INS MINI EVO BLACK チェキ instax mini Evo - \n画面サイズ : 62mm × 46mm, レンズ : 60mm 1:12.7, ファインダー : 実像式ファインダー0.37倍/ターゲットマーク付き, シャッター : プログラム式電子シャッター1/2~1/250秒 低輝度スローシンクロ, 詳細は',
                                    style: TextStyle(color: Colors.white)),
                                TextSpan(
                                    text: 'こちら',
                                    style:
                                        const TextStyle(color: Colors.indigo),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        // タップ時
                                        await launch(
                                            'https://instax.jp/mini40/');
                                      }),
                                const TextSpan(
                                    text:
                                        'から.\n\n- Nikon1 V2 -\n有効画素数 : 1425万画素, ISO感度 : ISO160-6400, 高速連続撮影 : AF追従, 約15コマ/秒, 動画撮影 : フルHD 1080/60i, 詳細は',
                                    style: TextStyle(color: Colors.white)),
                                TextSpan(
                                    text: 'こちら',
                                    style:
                                        const TextStyle(color: Colors.indigo),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        // タップ時
                                        await launch(
                                            'https://www.nikon-image.com/products/mirrorless/lineup/v2/');
                                      }),
                                const TextSpan(
                                    text: 'から.',
                                    style: TextStyle(color: Colors.white)),
                              ])),
                            ]),
                      ),
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
