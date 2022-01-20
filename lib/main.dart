import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: prefer-match-file-name, public_member_api_docs
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _MyHomePage(title: 'Flutter Test app'),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  final String title;

  const _MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}

class _MyHomePageState extends State<_MyHomePage> {
  final Random _random = Random();

  Color _backgroundColor = const Color.fromRGBO(0, 0, 0, 1.0);

  void _changeColor() {
    setState(() => _getRandomColor());
  }

  void _getRandomColor() {
    final int _colorRedValue = _random.nextInt(256);
    final int _colorGreenValue = _random.nextInt(256);
    final int _colorBlueValue = _random.nextInt(256);
    _backgroundColor = Color.fromRGBO(
      _colorRedValue,
      _colorGreenValue,
      _colorBlueValue,
      1.0,
    );
  }

  bool _checkColorBrightness() {
    return ThemeData.estimateBrightnessForColor(_backgroundColor) ==
        Brightness.light;
  }

  @override
  void initState() {
    super.initState();
    _getRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid-non-null-assertion
    final TextStyle _textStyle = Theme.of(context).textTheme.headline3!;

    return GestureDetector(
      onTap: () => _changeColor(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: AnimatedContainer(
          duration: kThemeAnimationDuration,
          decoration: BoxDecoration(
            color: _backgroundColor,
          ),
          child: Center(
            child: AnimatedDefaultTextStyle(
              style: _textStyle.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                color: _checkColorBrightness() ? Colors.black : Colors.white,
              ),
              duration: kThemeAnimationDuration,
              child: const Text(
                "Hey there",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
