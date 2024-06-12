


import 'package:flutter/material.dart';

class CacheManager {
  static final CacheManager _singleton = CacheManager._internal(); //calling named constructor
  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory CacheManager() {
    return _singleton;
  }
  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this clflass
  CacheManager._internal(){
    // initialization logic
  }
  var themeMode = ThemeMode.light;
  var  screenWidth = 372.0;  //iphoneX's width
  var  screenHeight = 812.0; //iphoneX's height
}

