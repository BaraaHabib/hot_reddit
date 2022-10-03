part of 'splash_bloc.dart';

abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {
}

class SplashLoading extends SplashState {
}

class SplashError extends SplashState {
  // final Function callBack;
  final String message;

  const SplashError({ required this.message});
}

class SplashLoaded extends SplashState {
  const SplashLoaded(this.initResult);

  final InitResult initResult;
}


