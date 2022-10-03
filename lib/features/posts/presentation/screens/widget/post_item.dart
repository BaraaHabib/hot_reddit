


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hot_reddit/core/app/state/appstate.dart';
import 'package:hot_reddit/core/configurations/app_configuration.dart';
import 'package:hot_reddit/core/configurations/assets.dart';
import 'package:hot_reddit/core/configurations/styles.dart';
import 'package:hot_reddit/core/routing/route_paths.dart';
import 'package:hot_reddit/core/utils.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/posts_entity.dart';
import '../comments_screen.dart';

class PostsItem extends StatelessWidget {
  PostsItem({required this.post,Key? key, required this.appState}) : super(key: key);

  final PostEntity post;
  final AppStateModel appState ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.pushNavigateTo(context, RoutePaths.comments,arguments: CommentsPageArgs(post: post)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 25.h),
        decoration: BoxDecoration(
          color: appState.isLightTheme ? Colors.white : Styles.colorPrimaryDark,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(24)),
          border: Border.all(width: 1,color:Color.fromARGB(6, 0, 0, 0) ),
          boxShadow: [
            Styles.boxShadow,
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Published by ${post.innerData?.author}",
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                color: Styles.subTitleCustomColor,
              ),
            ),
            CommonSizes.v5,
            Text(
              "${AppConfigurations.appDisplayDateFormat.format(post.innerData!.creationDate)}",
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                color: Styles.subTitleCustomColor,
              ),
            ),
            CommonSizes.v10,
            Text(
              "${post.innerData?.title}",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w600),
            ),
            CommonSizes.v10,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(Assets.AssetsComments),
                SizedBox(width: 10.w,),
                Text(
                  post.innerData?.numComments?.toString() ?? '0',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Styles.subTitleCustomColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
