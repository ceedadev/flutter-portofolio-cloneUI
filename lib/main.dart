// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloneui/screens/instagram.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: appRoute,
    );
  }
}

Map<String, WidgetBuilder> appRoute = {
  '/instagram': (BuildContext context) => InstagramScreen(),
};

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _myCustomElevatedButton(title: 'Whatsapp Clone', assetName: 'assets/icon/whatsapp.png'),
              _myCustomElevatedButton(title: 'Instagram Clone', assetName: 'assets/icon/instagram.png', onPressed: () => Navigator.pushNamed(context, '/instagram')),
            ],
          ),
        ),
      ),
    );
  }

  _myCustomElevatedButton({
    required String title,
    required String assetName,
    Function? onPressed,
  }) {
    return SizedBox(
      width: 240,
      child: ElevatedButton(
        onPressed: () => onPressed!(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImageIcon(AssetImage(assetName), size: 24),
            Text(title),
            SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
