import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hot_reddit/core/configurations/app_configuration.dart';
import 'package:hot_reddit/features/posts/presentation/blocs/posts_bloc.dart';
import 'package:hot_reddit/features/splash/bloc/splash_bloc.dart';
import 'package:provider/provider.dart';

import 'core/app/state/appstate.dart';
import 'core/feature/presentation/theme/style.dart';
import 'core/navigation_service.dart';
import 'core/routing/route_paths.dart';
import 'core/routing/router.dart';
import 'features/posts/presentation/screens/posts_screen.dart';
import 'generated/l10n.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.bottom,
      SystemUiOverlay.top,
    ],
  );
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  initInjection();
  await sl<AppStateModel>().initTheme();
  runApp(const HotRedditApp());
}

class HotRedditApp extends StatelessWidget {
  const HotRedditApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => sl<AppStateModel>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SplashBloc>(
            create: (BuildContext context) => SplashBloc(),
          ),
          BlocProvider<PostsBloc>(
            create: (BuildContext context) => PostsBloc(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          builder: (ctx,widget) => Consumer<AppStateModel>(
            builder: (ctx,model,widget) => MaterialApp(
              title: AppConfigurations.applicationName,
              navigatorKey: sl<NavigationService>().navigatorKey,
              theme: appLightTheme ,
              darkTheme: appDarkTheme,
              themeMode: model.theme,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              // home: const MyHomePage(
              //   title: 'Flutter Demo Home Page',
              // ),
              initialRoute: RoutePaths.splashPage,
              // home: SplashScreen(),
              // theme: appTheme,
              onGenerateRoute: AppRouter.generateRoute,
              onUnknownRoute: (settings) => MaterialPageRoute(
                builder: (context) => const PostsPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

