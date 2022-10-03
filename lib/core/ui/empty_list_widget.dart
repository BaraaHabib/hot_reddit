import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hot_reddit/core/configurations/styles.dart';

import '../../generated/l10n.dart';
import '../configurations/assets.dart';
import '../utils.dart';

class EmptyListWidget extends StatefulWidget {
  EmptyListWidget({
    required this.entity,
    required this.withButton,
    this.buttonAction,
    this.buttonText,
  });

  final bool withButton;
  final String? buttonText;
  final String entity;
  final VoidCallback? buttonAction;

  @override
  State<StatefulWidget> createState() => EmptyListWidgetState();
}

class EmptyListWidgetState extends State<EmptyListWidget> {

  @override
  Widget build(BuildContext context) =>  Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         SizedBox(
           width: 300.w,
           child: Text(
             S.of(context).noItemsFound(widget.entity),
             textAlign: TextAlign.center,
           ),
         ),
         SizedBox(
           height: 25.h,
         ),
        widget.withButton?
         ElevatedButton(
           onPressed: widget.buttonAction,
           child: Text(widget.buttonText ?? ''),
         )
             :
          Container()

       ],
     ),
    );
}
