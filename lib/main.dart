import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screens_ui/shared/chash_helper.dart';
import 'package:screens_ui/shared/cubits/block_observer.dart';

import 'home_screnat.dart';
import 'shared/cubits/app_cubit.dart';
import 'shared/cubits/app_states.dart';
import 'shared/styles/thems.dart';

void main() async {
  // BlocOverrides.runZoned(
  //       () async {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     await CacheHelper.init();
  //     runApp(const MyApp());
  //   },
  //   blocObserver: MyBlocObserver(),
  // );
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..init(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          AppCubit cubit = AppCubit.get(context);
          return MaterialApp(
            scrollBehavior: AppScrollBehavior(),
            debugShowCheckedModeBanner: false,
            theme: MyThemes.themeLight(),
            darkTheme: MyThemes.themeDark(),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            // ******** I'M HERE **********
            // home: LoginHome(),
            home: const HomeScrenat(),
            // home: TempHome(),
          );
        },
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}