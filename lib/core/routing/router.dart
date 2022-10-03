
import 'package:hot_reddit/core/routing/route_transitions/routes_transitions.dart';
import 'package:hot_reddit/main.dart';

import '../../features/posts/domain/entities/posts_entity.dart';
import '../../features/posts/presentation/screens/comments_screen.dart';
import '../../features/posts/presentation/screens/posts_screen.dart';
import '../../features/splash/pressentation/splash_screen.dart';
import 'route_paths.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.comments:
        return FadeRoute(page: CommentsPage(args: settings.arguments as CommentsPageArgs,), settings: settings);
      case RoutePaths.posts:
      return FadeRoute(page: PostsPage(), settings: settings);

      case RoutePaths.splashPage:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(
            // moduleId: settings.arguments as int,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('No route defined for ${settings.name}'),
                ),
          ),
        );
    }
  }
}
