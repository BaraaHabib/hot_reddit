


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hot_reddit/core/routing/route_paths.dart';
import 'package:provider/provider.dart';

import '../../../core/app/state/appstate.dart';
import '../../../core/configurations/assets.dart';
import '../../../core/configurations/styles.dart';
import '../../../core/ui/action_dialog.dart';
import '../../../core/utils.dart';
import '../../../generated/l10n.dart';
import '../../../injection_container.dart';
import '../bloc/splash_bloc.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState();

  @override
  Widget build(BuildContext context) => WillPopScope(
    onWillPop: () => Future.value(false) ,
    child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoaded) {
            _handleLoaded(context,state);
          } else if(state is SplashError) {
            _handleError(context,state);
          }
        },
        child: Container(
          color: Styles.colorPrimary,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      Assets.AssetsLogo,
                      scale: 4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  void _handleLoaded(context,SplashLoaded state) {
    Utils.clearAndPush(context, RoutePaths.posts,);
  }

  void _handleError(context,SplashError state) {
    showOneActionDialog(
      context,
      message: state.message,
      title: '',
      actions: [
        TextWithAction(
          text: S.of(context).retry,
          action: _initApp,
        )
      ],
    );
  }

  _initApp() => BlocProvider.of<SplashBloc>(context,listen: false).add(SplashInitEvent());
  @override
  void initState() {
    super.initState();
    _initApp();
  }
}
