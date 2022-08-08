import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPrefer;

  static init() async{
    sharedPrefer = await SharedPreferences.getInstance();
  }

  static setBool({required String key, required bool value}){
    sharedPrefer!.setBool(key, value);
  }

  static bool? getBool({required String key}){
    return sharedPrefer!.getBool(key);
  }




}