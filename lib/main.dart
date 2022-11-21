import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:setmusic/jiji.dart';
import 'config/config.dart';
import 'lickert.dart';

//deploy先をgithubにしてるからapikeyを公開しないとdeployされない現象が起きる
final configurations = Configurations();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: configurations.apiKey,
          messagingSenderId: configurations.messagingSenderId,
          projectId: configurations.projectId,
          appId: ''));
  runApp(MyApp());
}

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          //primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        //  home: const MyStatefulWidget(),
        home: const LickertPage(
          title: 'lickert',
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  final _isHovering = [false, false, false, false];

  AudioPlayer player = new AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: Stack(
            children: [
              Container(
                //color: Colors.blue,
                height: screenSize.height * 0.45,
                width: screenSize.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "images/9F2621A6-4CE6-4067-A448-6BED3FAE31F7.jpg"))),
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
                  )),
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
