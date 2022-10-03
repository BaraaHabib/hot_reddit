

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app/state/appstate.dart';
import '../../../../../core/configurations/assets.dart';
import '../../../../../core/configurations/styles.dart';
import '../../../../../generated/l10n.dart';

class AppBarBackground extends StatelessWidget{
  AppStateModel? _appState ;

  AppBarBackground({
    required this.actionWidget,
    required this.actionCallback,
  });

  final void Function() actionCallback;
  final Widget actionWidget;
  @override
  Widget build(BuildContext context) {
    _appState ??= Provider.of<AppStateModel>(context,listen: false);
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(end: 25.w),
          height: 120.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(50)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CommonSizes.h20,
              Text('Reddit',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
              ),
              // CommonSizes.h10,
              Spacer(),
              // CommonSizes.h10,
              // CommonSizes.h10,
              GestureDetector(
                onTap: actionCallback ,
                child: actionWidget,
              ),
            ],
          ),
        ),
        Container(
          height: 80.h,
          color: Theme.of(context).primaryColor,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(100.r)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                    S.of(context).hotPosts,
                    style: Theme.of(context).textTheme.headline5
                        ?.copyWith(
                        color: Styles.colorAppRed,
                        fontWeight: FontWeight.w600
                    )
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset(Assets.AssetsFireSvg,),
                SizedBox(width: 10.w),
              ],
            ),
          ),
        ),
      ],
    );
  }

}