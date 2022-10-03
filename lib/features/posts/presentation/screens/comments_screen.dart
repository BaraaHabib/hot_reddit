import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hot_reddit/core/app/state/appstate.dart';
import 'package:hot_reddit/core/configurations/assets.dart';
import 'package:hot_reddit/core/configurations/styles.dart';
import 'package:hot_reddit/core/ui/error_dialog.dart';
import 'package:hot_reddit/core/ui/waiting_widget.dart';
import 'package:hot_reddit/core/ui/yolo_container.dart';
import 'package:hot_reddit/core/utils.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_all_comments_params.dart';
import 'package:hot_reddit/features/posts/domain/entities/more_entity.dart';
import 'package:hot_reddit/features/posts/domain/entities/posts_entity.dart';
import 'package:hot_reddit/features/posts/presentation/screens/widget/comment_item.dart';
import 'package:hot_reddit/features/posts/presentation/screens/widget/post_item.dart';
import 'package:provider/provider.dart';

import '../../../../core/ui/empty_list_widget.dart';
import '../../../../generated/l10n.dart';
import '../../data/remote/models/params/get_comments_params.dart';
import '../../data/remote/models/params/user_info_comments_params.dart';
import '../../domain/entities/comments_entity.dart';
import '../blocs/posts_bloc.dart';
import 'widget/appbar_background.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({required this.args, Key? key,}) : super(key: key);

  final CommentsPageArgs args;

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  late PostsBloc _bloc ;
  late AppStateModel _appState ;
  var comments = <CommentEntity>[];
  MoreEntity? moreEntity;
  var scrollController = ScrollController();
  bool isShowingReplies = false;
  @override
  void initState() {
    _bloc = BlocProvider.of<PostsBloc>(context,listen: false);
    _loadData();
    _appState = Provider.of<AppStateModel>(context,listen: false);
    scrollController.addListener(() {
      if(scrollController.offset == scrollController.position.maxScrollExtent){
        // _loadData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            moreEntity = null;
            isShowingReplies = false;
            _loadData();
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
                foregroundColor: Theme
                    .of(context)
                    .primaryColor,
                flexibleSpace: FlexibleSpaceBar(
                  background: AppBarBackground(
                    actionCallback: () {
                      Utils.popNavigate(context);
                    },
                    actionWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.arrow_back_outlined, color: Colors.white,),
                        CommonSizes.h5,
                        Text(S
                            .of(context)
                            .back, style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                ),
                floating: false,
                pinned: false,
                expandedHeight: 220.h,

              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                sliver: SliverToBoxAdapter(
                  child: Hero(
                      tag: 'post-${widget.args.post.innerData?.id}',
                      child: PostsItem(
                        post: widget.args.post, appState: _appState,)),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          S.of(context).comment,
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                        (ctx,index) => BlocConsumer<PostsBloc, PostsState>(
              listener: (ctx, state) {
                if (state is CommentsLoaded) {
                  if (moreEntity == null) {
                    comments.clear();
                  }
                  comments.addAll(state.comments.data?.comments ?? []);
                  moreEntity = state.comments.data?.more;
                  // load images
                  comments.forEach((element) {
                    BlocProvider.of<PostsBloc>(context,listen: false,).add(
                      GetUserInfoEvent(UserInfoParams(name: element.innerData?.author ?? ''),
                      ),
                    );
                  });
                }
                else if (state is AllCommentsLoaded) {
                  comments.clear();
                  comments.addAll(
                      state.comments.json?.data?.things?.map((e) =>
                          e.toComment()).toList() ?? []);
                }
              },
              buildWhen: buildAndListenWhen,
              listenWhen: buildAndListenWhen,
              builder: (ctx, state) {
                if (state is CommentsLoading && !state.isFetchingPage) {
                  return Container(
                      margin: EdgeInsets.all(100),
                      child: WaitingWidget(),
                  );
                }
                else if (state is CommentsError) {
                  return AppErrorWidget(
                    message: state.message ?? '',
                    onReloadPressed: _loadData,
                  );
                }
                if (comments.isEmpty) {
                  return _emptyWidget();
                }
                return
                  ListView.separated(
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    separatorBuilder: _separatorBuilder,
                    itemCount: comments.length + 1,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == comments.length) {
                        // if we reached the last page
                        if (moreEntity == null) {
                          return SizedBox.shrink();
                        }
                        // load mode
                        return WaitingWidget();
                      }
                      return _itemBuilder(context, index);
                    },
                  );
              },
            ),
                )
              ),
            ],

          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index,) => CommentItem(
      comment: comments[index],
      isShowingReplies:isShowingReplies,
    onViewReplies: (){
        var mainComment = comments[index];
        comments.clear();
        for(var c in mainComment.innerData!.replies){
          comments.add(c.toComment);
        }
        isShowingReplies = true;
        setState(() {});
    },
  );

  bool buildAndListenWhen(ps,cs,)  =>
      cs is CommentsLoading ||
      cs is   CommentsLoaded ||
      cs is    CommentsError ||
      cs is AllCommentsLoading ||
      cs is   AllCommentsLoaded ||
      cs is    AllCommentsError
  ;

  void _loadData() {
    _bloc.add(
      GetPostCommentsEvent(
        CommentsParams(
          postId: widget.args.post.innerData?.id ?? '',
        ),
      ),
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) => Divider(
    height: 0.h,
    endIndent: 30,
    thickness: 0.7,
  );

  Widget _emptyWidget() => EmptyListWidget(
    entity: S.of(context).comments,
    withButton: true,
    buttonAction: _loadData,
    buttonText: S.of(context).retry,
  );
}

class CommentsPageArgs{
  CommentsPageArgs({
    required this.post,
  });

  final PostEntity post;

}