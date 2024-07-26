import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Modal/GeetaModal.dart';

class HomeProvider extends ChangeNotifier
{
  List<GeetaModal> geetaList=[];
  int openSlokStoreIndex=0;
  int openAdhyayStoreIndex=0;
  late String language='sanskrit';
  bool isDark=false;

  Future<void> initState()
  async {
    String json = await rootBundle.loadString('assets/json/four_language.json');
    List geetaJson=jsonDecode(json);
    geetaList=geetaJson.map((e) => GeetaModal.fromJson(e),).toList();
    print(geetaList[0].languages.sanskrit[34]);
    notifyListeners();
  }

  void openAdhyayNumber(int openAdhyay)
  {
    this.openAdhyayStoreIndex=openAdhyay;
    notifyListeners();
  }

  void openSlok(int openSlok)
  {
    this.openSlokStoreIndex=openSlok;
    notifyListeners();
  }

  void changeLanguages(String language1)
  {
    language=language1;
    notifyListeners();
  }

  void darkMode()
  {
    isDark=!isDark;
    notifyListeners();
  }
  HomeProvider()
  {
    initState();
  }
}