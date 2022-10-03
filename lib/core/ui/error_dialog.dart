import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    required this.message,
    required this.onReloadPressed,
    this.width = 250,
    this.height = 300,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final String message;
  final VoidCallback onReloadPressed;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height * 0.98,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.05,
        ),
        child: Center(
          child: Container(
            width: width * 0.6,
            height: height * 0.8,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.1,
              vertical: height * 0.05,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              color: Colors.white,
              // gradient: LinearGradient(
              //   colors: [Styles.ColorLiteGray1, Styles.ColorLiteGray2],
              // ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message,

                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  child: Text(S.current.retry),
                  onPressed: onReloadPressed,
                ),
              ],
            ),
          ),
        ),
      );
}
