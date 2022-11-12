import 'package:flutter/material.dart';
import 'package:boxing_timer/resources/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:boxing_timer/ui_elements/keyboard.dart';
import 'package:boxing_timer/providers/system_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controllerText = TextEditingController();
  final FocusNode _locationFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SystemProvider>(
      create: (context) => SystemProvider(_controllerText),
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: kBoxBackground,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Add here new widgets
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Keyboard(
                    controllerText: _controllerText,
                    focus: _locationFocus,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
