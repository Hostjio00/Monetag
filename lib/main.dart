import 'package:flutter/material.dart';
import 'package:notix_inapp_flutter/notix.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late InterstitialLoader loader;
  late InterstitialData currentInterstitialData;

  @override
  void initState() {
    super.initState();
    initNotix();
  }

  Future<void> initNotix() async {
   // await Notix.Notification.init(/* your notixAppId */, /* your notixToken */);
    loader = await Notix.Interstitial.createLoader(/* your zone id */7275536);
    loader.startLoading();
    loadNextInterstitial();
  }

  Future<void> loadNextInterstitial() async {
    try {
      currentInterstitialData = await loader.next();
    } catch (e) {
      /* handle exception */
    }
  }

  void showInterstitial() {
    if (currentInterstitialData != null) {
      Notix.Interstitial.show(currentInterstitialData);
      loadNextInterstitial();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff66ff66), Color(0xff00ffff)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Monetag Self Click',
            style: TextStyle(fontSize: 30, color: Colors.black,
            fontStyle: FontStyle.italic),
          ),
          toolbarHeight: 140,
          centerTitle: true,
          backgroundColor: Color(0xffffff66),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),

        ),
        body: Center(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 150.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffffcc00),
                    foregroundColor: Colors.black,
                    fixedSize: Size(140, 40),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                    onPressed: showInterstitial,
                    child: Text('Show Ads')
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: ElevatedButton(
                    onPressed: showInterstitial,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff66ff66),
                      foregroundColor: Colors.black,
                      fixedSize: Size(140, 40),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    child: Text('Show Ads')
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: ElevatedButton(
                    onPressed: showInterstitial,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffffff66),
                      foregroundColor: Colors.black,
                      fixedSize: Size(140, 40),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    child: Text('Show Ads')
                ),
              ),


              Padding(
                padding: EdgeInsets.only(top: 140.0),
                child: ElevatedButton(
                    child: Text("contact us"),
                    onPressed:() {
                      const link = "https://telegram.me/policehost";
                      launchUrl(
                          Uri.parse(link),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    fixedSize: Size(180, 40),
                    textStyle: TextStyle(fontSize: 25),
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Developer by Manik'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
