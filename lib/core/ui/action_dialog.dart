


// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hot_reddit/core/configurations/assets.dart';
import 'package:hot_reddit/core/ui/show_dialog.dart';

import '../configurations/styles.dart';


class TextWithAction {
  TextWithAction({required this.text, required this.action});

  final String text;
  final Function action;
}
Future showOneActionDialog(BuildContext context,{
  required String title,
  required String message,
  required List<TextWithAction> actions,
  bool barrierDismissible = false,
}) async {
  await ShowDialog().showElasticDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (c) =>
        Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          child: Container(
            height: 250.h,
            width: 200.w,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(Assets.AssetsLogo,scale: 8),
                Text(title, style: Theme
                    .of(context)
                    .textTheme
                    .headline6,),
                CommonSizes.v5,
                Text(message, style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,),
                CommonSizes.v5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                  actions.map((e) =>
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          e.action.call();
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Styles.colorPrimary),),
                        child: Text(e.text,),
                      ),).toList(),
                )
              ],
            ),
          ),
        ),);
}

