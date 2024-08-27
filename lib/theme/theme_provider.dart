
import 'package:flutter/material.dart';
import 'package:isar_notes/theme/themeData.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeData _themeData = lightmode; //dont make _themeData as final as it will be assigned a new obj by condition
  //(and its reference will change because variables with final cant have their references changed)     

  ThemeData get currentTheme{
    return _themeData;
  }

  bool get isDarkMode{
    return _themeData == darkmode;
  }

  void toggleMode(){
    _themeData = isDarkMode ? lightmode : darkmode;
    notifyListeners();
  }

}