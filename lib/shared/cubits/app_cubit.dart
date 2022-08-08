import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../chash_helper.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void init() {

  }

  // shared vars
  bool isDark = CacheHelper.getBool(key: 'isDark') ?? false;

  // cache
  void changeIsDark() {
    isDark = !isDark;
    CacheHelper.setBool(key: 'isDark', value: isDark);
    emit(AppChangeDarkModState());
  }

}
