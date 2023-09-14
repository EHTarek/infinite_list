// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  const SimpleBlocObserver();

 /* @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    print('Event: ${transition.event}');
    print('Transition: ${transition.currentState} ---> ${transition.nextState}');
  }*/

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    print('Change: ${change.currentState} ---> ${change.nextState}');
    super.onChange(bloc, change);
  }
}
