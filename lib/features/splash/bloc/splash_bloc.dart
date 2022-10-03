// ignore_for_file: lines_longer_than_80_chars, no_default_cases


import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hot_reddit/core/feature/domain/entities/error_entity.dart';
import 'package:hot_reddit/core/navigation_service.dart';
import 'package:hot_reddit/features/account/data/remote/models/params/authorize_params.dart';
import 'package:hot_reddit/features/account/domain/entities/account_entity.dart';


import '../../../../injection_container.dart';
import 'package:provider/provider.dart';

import '../../../core/app/state/appstate.dart';
import '../../../core/exceptions/app_exceptions.dart';
import '../../account/data/repositories/account_repository.dart';
import '../../account/domain/use_cases/authorize_use_case.dart';
import '../../posts/presentation/blocs/posts_bloc.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitEvent>((event, emit) async {
      emit(SplashLoading());

      try {
        BuildContext context = sl<NavigationService>().navigatorKey.currentContext!;
        final appState = Provider.of<AppStateModel>(context,listen: false);
        await appState.init();
        var connectResult = await Connectivity().checkConnectivity();

        if(connectResult == ConnectivityResult.none){
          throw NoInternetException(message: 'No internet connection');
        }
        if(appState.isSessionExpired){
          final authRes = await AuthorizeUseCase(sl<AccountRepository>()).call(AuthorizeParams());
          var res = authRes.fold(
                (l) => l,
                (r) => r,
          );
          if(authRes.isLeft()){
            throw Exception((res as ErrorEntity).errorMessage);
          }
          else{
            await appState.authorizeApp(res as AuthorizationEntity);
            emit(
              SplashLoaded(InitResult()),
            );
          }
        }
        else{
          await Future.delayed(Duration(seconds: 2));
          emit(
            SplashLoaded(InitResult()),
          );
        }

        // await Future.delayed(Duration(seconds: 2));

      } on Exception catch (e) {
        emit(
          SplashError(
            message: e.toString(),
          ),
        );
      } finally {}
    });
  }





  }


class InitResult {
  InitResult();

}
