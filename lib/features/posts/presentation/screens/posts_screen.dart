import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hot_reddit/core/app/state/appstate.dart';
import 'package:hot_reddit/core/configurations/assets.dart';
import 'package:hot_reddit/core/ui/error_dialog.dart';
import 'package:hot_reddit/core/ui/waiting_widget.dart';
import 'package:hot_reddit/core/ui/yolo_container.dart';
import 'package:hot_reddit/features/posts/presentation/blocs/posts_bloc.dart';
import 'package:hot_reddit/features/posts/presentation/screens/widget/appbar_background.dart';
import 'package:hot_reddit/features/posts/presentation/screens/widget/post_item.dart';
import 'package:provider/provider.dart';

import '../../../../core/configurations/styles.dart';
import '../../../../core/ui/empty_list_widget.dart';
import '../../../../generated/l10n.dart';
import '../../data/remote/models/params/get_posts_params.dart';
import '../../data/remote/models/responses/get_posts_model.dart';
import '../../domain/entities/posts_entity.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key,}) : super(key: key);


  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  late PostsBloc _bloc ;
  late AppStateModel _appState ;
  var posts = <PostEntity>[];
  String? after = null;
  DateTime? currentBackPressTime;

  var scrollController = ScrollController();

  @override
  void initState() {
    _bloc = BlocProvider.of<PostsBloc>(context,listen: false);
    _loadData();
    _appState = Provider.of<AppStateModel>(context,listen: false);
    scrollController.addListener(() {
      if(scrollController.offset == scrollController.position.maxScrollExtent){
        _loadData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async{
              after = null;
              _loadData();
            },
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  foregroundColor: Theme.of(context).primaryColor,
                  elevation: 0,
                  titleSpacing: 0,
                  title: Text(""),
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(""),
                    background: AppBarBackground(
                      actionCallback: _appState.changeMode,
                      actionWidget: SvgPicture.asset(_appState.isLightTheme ? Assets.AssetsMoonSvg : Assets.AssetsSunSvg),
                    ),
                  ),

                  floating: false,
                  pinned: false,
                  expandedHeight: 220.h,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: 1,
                      (ctx,index) =>BlocConsumer<PostsBloc,PostsState>(
                        listener: (ctx,state){
                          if(state is PostsLoaded){
                            if(after == null){
                              posts.clear();
                            }
                            posts.addAll(state.posts.data?.children ?? []);
                            after = state.posts.data?.after;
                          }
                        },
                        buildWhen: buildAndListenWhen,
                        listenWhen: buildAndListenWhen,
                        builder: (ctx,state) {
                          if (state is PostsLoading && !state.isFetchingPage) {
                            return Container(
                                margin: EdgeInsets.all(100),
                                child: WaitingWidget(),
                            );
                          }
                          else if (state is PostsError) {
                            return AppErrorWidget(
                              message: state.message ?? '',
                              onReloadPressed: _loadData,
                            );
                          }
                          return ListView.separated(
                            primary: false,
                            shrinkWrap: true,
                            separatorBuilder: _separatorBuilder,
                            itemCount: posts.length + 1,
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            itemBuilder: (BuildContext context, int index,) {
                              if (index == posts.length) {
                                // if we reached the last page
                                if (after == null) {
                                  return SizedBox.shrink();
                                }
                                // load mode
                                return WaitingWidget();
                              }
                              if(posts.isEmpty){
                                return _emptyWidget();
                              }
                              return Hero(
                                tag: 'post-${posts[index].innerData?.id}',
                                child: _itemBuilder(context, index),
                              );
                            },
                          );
                        },
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) => PostsItem(post: posts[index],appState: _appState,);

  bool buildAndListenWhen(ps,cs,)  =>
      cs is PostsLoading ||
      cs is   PostsLoaded ||
      cs is    PostsError;

  void _loadData(){
    if(_bloc.state is PostsLoading ) {
      return;
    }
    if(after != null){
      _bloc.add(GetHotPostsEvent(PostsParams(after: after,count:posts.length)));
    }else {
      _bloc.add(GetHotPostsEvent(PostsParams()));
    }
  }

  Widget _separatorBuilder(BuildContext context, int index) => SizedBox(height: 12.h,);

  Widget _emptyWidget() => EmptyListWidget(
    entity: S.of(context).posts,
    withButton: true,
    buttonAction: _loadData,
    buttonText: S.of(context).retry,
  );

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: S.of(context).pressBackAgainToExit);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
