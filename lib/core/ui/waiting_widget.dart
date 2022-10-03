import 'package:flutter/material.dart';

import '../configurations/styles.dart';

class WaitingWidget extends StatelessWidget {
  WaitingWidget();

  @override
  Widget build(BuildContext context) => Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
}
