


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hot_reddit/core/app/state/appstate.dart';
import 'package:hot_reddit/core/configurations/assets.dart';
import 'package:hot_reddit/core/configurations/styles.dart';
import 'package:hot_reddit/features/posts/domain/entities/get_all_comments_entity.dart';
import 'package:hot_reddit/features/posts/domain/entities/posts_entity.dart';
import 'package:hot_reddit/features/posts/presentation/screens/widget/profile_image.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/l10n.dart';
import '../../../domain/entities/comments_entity.dart';


class CommentItem extends StatelessWidget {
  CommentItem({
    required this.comment,
    required this.onViewReplies,
    Key? key,
    required this.isShowingReplies,
  }) : super(key: key);

  final bool isShowingReplies;
  final CommentEntity comment;
  final Function() onViewReplies;

  late final AppStateModel appState ;
  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppStateModel>(context,listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 25.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
          flex: 2,
              child: ProfileImage(
                  key: ValueKey(comment.innerData?.author),
                  user: comment.innerData?.author ?? ''),
          ),
          CommonSizes.h10,
          Expanded(
            flex: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${comment.innerData?.author}",
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontWeight: FontWeight.w600,
                  ),
                ),
                CommonSizes.v10,
                Text(
                  "${comment.innerData?.body}",
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Styles.subTitleCustomColor,
                  ),
                ),
                if(comment.innerData!.replies.isNotEmpty && !isShowingReplies)
                  ...[
                    CommonSizes.h10,
                  TextButton(
                    onPressed: () {
                      onViewReplies.call();
                    },
                    child: Text(
                        '${S.of(context).viewReplies} (${comment.innerData!.replies.length})',
                        style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),]
              ],
            ),
          ),

        ],
      ),
    );
  }
}
