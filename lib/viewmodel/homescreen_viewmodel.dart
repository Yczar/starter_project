import 'package:flutter/cupertino.dart';
import 'package:starterproject/model/picture.dart';
import 'package:starterproject/services/web_services.dart';

class HomeScreenViewModel extends ChangeNotifier{
  List<Picture> _weather;
  List<Picture> get weather => _weather;

  Future fetchWeatherdata() async{
    var res = await WebServices().weatherCheck();
    if(res is List<Picture>){
      _weather = res;
      notifyListeners();
    }
  }
}