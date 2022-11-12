import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:boxing_timer/models/system_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SystemProvider with ChangeNotifier {
  SystemModel systemModel = SystemModel();
  final TextEditingController _controllerText;

  SystemProvider(this._controllerText) {
    initialState();
  }

  void initialState() {
    syncDataWithProvider();
  }

  void changeEditState() {
    systemModel.changeEnableEditState();
    notifyListeners();
  }

  SystemModel getSystemModel() {
    return systemModel;
  }

  bool? getEditState() {
    return systemModel.getEnableEditState();
  }

  void configureSystem(SystemModel _systemModel) {
    systemModel = _systemModel;
    updateSharedPreferences();
    //notifyListeners();
  }

  void updateSystemModel(SystemModel _systemModel) async {
    systemModel = _systemModel;
    updateSharedPreferences();
    notifyListeners();
  }

  void updateSharedPreferences() async {
    String mySystemModel = json.encode(systemModel.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('systemModel', mySystemModel);
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var mySettings = prefs.getString('systemModel');

    if (mySettings != null) {
      systemModel = SystemModel.fromJson(json.decode(mySettings));
      notifyListeners();
    }
  }
}
