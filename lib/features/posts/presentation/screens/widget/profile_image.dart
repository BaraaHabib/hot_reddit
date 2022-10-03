

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hot_reddit/core/configurations/assets.dart';
import 'package:hot_reddit/core/ui/waiting_widget.dart';
import 'package:hot_reddit/features/posts/presentation/blocs/posts_bloc.dart';

import '../../../../../core/feature/data/data_sources/remote_data_source.dart';
import '../../../../../injection_container.dart';
import '../../../data/remote/data_sources/posts_remote_data_source.dart';
import '../../../data/remote/models/params/user_info_comments_params.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({required this.user, Key? key,}) : super(key: key);
  final String user;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: BlocConsumer<PostsBloc, PostsState>(
        listener: (ctx, cs) {

        },
        listenWhen: buildAndListenWhen,
        buildWhen: buildAndListenWhen,
        builder: (ctx, state) {
          if (state is UserInfoLoading && state.user == user) {
            return WaitingWidget();
          }
          else if (state is UserInfoLoaded && state.user == user) {
            return FadeInImage(
              placeholder: Image
                  .asset(Assets.AssetsLogo)
                  .image,
              image: Image
                  .network(
                  state.userInfo.data?.snoovatarImg ?? '')
                  .image,
              imageErrorBuilder: (c, s, e) => Image.asset(Assets.AssetsLogo),
            );
          }
          else {
            return Image.asset(Assets.AssetsLogo);
          }
        },
      ),
    );
  }


  bool buildAndListenWhen(ps, cs,) =>
      (cs is UserInfoLoading ||
          cs is UserInfoLoaded ||
          cs is UserInfoError) && (cs as UserInfoState).user == user;
}
